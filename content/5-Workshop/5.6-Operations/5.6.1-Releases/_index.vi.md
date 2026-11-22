---
title: "Tự động phát hành với GitHub Actions và ECR"
date: 2026-11-20
weight: 1
chapter: false
pre: " <b>5.6.1.</b> "
---

## Theo dõi một bản phát hành

**Push lên GitHub → kiểm tra và build → đẩy image lên ECR riêng tư → triển khai trên Lightsail.**

Amazon Elastic Container Registry (ECR) lưu các Docker image sẵn sàng để chạy. GitHub Actions tạo image và đặt tag bất biến theo commit. Máy Lightsail kiểm tra ECR hai phút một lần rồi tải đúng image theo digest. Máy chạy migration trên RDS, thay container ứng dụng và kiểm tra trang chủ cùng trang đăng nhập. Caddy tiếp tục phục vụ trang qua CloudFront.

Lần chạy đầu tiên trên production ngày 20/11/2026 đưa hiệu ứng chữ ở cuối trang đăng nhập lên từ commit `4034749`. GitHub kiểm tra TypeScript và chạy thành công cả 21 bài kiểm thử logic học từ. Tác vụ theo lịch trên VM chạy migration rồi khởi động ứng dụng. Kiểm tra bằng trình duyệt xác nhận hiệu ứng chuyển động trên trang đăng nhập công khai. Các bước sau đây dùng tài nguyên lab của bạn. [Lần chạy production (cần quyền dự án)](https://github.com/ImLTK/ownword/actions/runs/44740794986)

## 1. Chuẩn bị kho image và hai nhóm quyền

Hoàn thành [lần triển khai đầu tiên](../../5.5-auth/#launch-app) và [cấu hình AWS CLI profile trên VM](../). Tại Singapore, tạo kho ECR **riêng tư** tên `ownword-lab` và bật **tag bất biến**. Trong IAM, tạo hoặc dùng lại nhà cung cấp OIDC `https://token.actions.githubusercontent.com` với audience `sts.amazonaws.com`. [Tạo kho ECR riêng tư](https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-create.html) · [GitHub OIDC trên AWS](https://docs.github.com/en/actions/how-tos/secure-your-work/security-harden-deployments/oidc-in-aws)

| Danh tính | Quyền cần cấp |
| --- | --- |
| Role dùng để đẩy image từ GitHub | Cho phép `sts:AssumeRoleWithWebIdentity` từ nhà cung cấp OIDC. Ràng buộc `aud` bằng `sts.amazonaws.com` và `sub` theo đúng kho riêng tư cùng nhánh `refs/heads/release/lightsail`. Dùng định dạng subject theo hướng dẫn GitHub, kèm ID chủ sở hữu và kho nếu kho dùng subject bất biến. Trên ARN kho ECR lab, cấp `ecr:BatchCheckLayerAvailability`, `ecr:InitiateLayerUpload`, `ecr:UploadLayerPart`, `ecr:CompleteLayerUpload`, `ecr:PutImage` và `ecr:BatchGetImage`. |
| Danh tính AWS CLI của Lightsail | Thêm policy chỉ đọc riêng cho danh tính sao lưu của lab. Trên ARN kho ECR lab, cấp `ecr:DescribeImages`, `ecr:BatchCheckLayerAvailability`, `ecr:GetDownloadUrlForLayer` và `ecr:BatchGetImage`. |

Cấp thêm `ecr:GetAuthorizationToken` với resource `*` cho cả hai danh tính. Giới hạn các quyền ECR còn lại ở `arn:aws:ecr:ap-southeast-1:YOUR_ACCOUNT_ID:repository/ownword-lab`. GitHub nhận thông tin xác thực ngắn hạn qua OIDC. Giữ cấu hình cơ sở dữ liệu và nhà cung cấp mô hình trên Lightsail. [Quyền đẩy image](https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-push-iam.html) · [Xác thực ECR](https://docs.aws.amazon.com/AmazonECR/latest/userguide/registry_auth.html)

## 2. Đẩy image lab từ GitHub

1. Tạo kho GitHub **riêng tư** và để trống. Trên máy cá nhân, giải nén một bản mã nguồn lab sạch rồi tạo nhánh `release/lightsail`. Xem lại các tệp đã stage trước khi commit. Giữ tệp môi trường, khóa SSH, thông tin xác thực AWS và bản sao lưu ngoài Git.
2. Tải {{< workshop-download "downloads/ownword-release/lightsail-release.yml" "workflow GitHub Actions" >}} vào `.github/workflows/lightsail-release.yml` trong kho lab. Tải {{< workshop-download "downloads/ownword-release/registry-release.sh" "script triển khai Lightsail" >}} vào `deploy/lightsail/registry-release.sh`. Workflow lab kiểm tra kiểu dữ liệu và build từ bản mã nguồn đã giải nén. Kho production còn có các bài kiểm thử logic học từ.
3. Trong **Settings → Secrets and variables → Actions → Variables**, đặt `OWNWORD_AWS_ACCOUNT_ID` thành ID tài khoản, `OWNWORD_ECR_REPOSITORY` thành `ownword-lab` và `OWNWORD_ECR_PUBLISH_ROLE_ARN` thành ARN của role lab. Push nhánh phát hành và xem **Actions → Lightsail release**. [Biến trong GitHub Actions](https://docs.github.com/en/actions/how-tos/write-workflows/choose-what-workflows-do/use-variables)

**Điểm kiểm tra.** Workflow thành công và ECR hiển thị image có tag `sha-<commit>` cùng digest. Ghi lại commit và digest để đối chiếu với log trên VM.

## 3. Để Lightsail triển khai image

Dùng kết nối SSH hiện có để chép script đã tải thành `~/registry-release.sh` trên VM lab. Dùng lại tên project và các tệp Compose từ lần triển khai đầu tiên. Thay `YOUR_ACCOUNT_ID` trước khi bật tác vụ.

```bash
umask 077
install -d -m 700 "$HOME/.config/ownword-release" "$HOME/.local/bin"
install -m 700 "$HOME/registry-release.sh" "$HOME/.local/bin/ownword-deploy-release"
cat > "$HOME/.config/ownword-release/settings.sh" <<'EOF'
export AWS_PROFILE=ownword-lab-backup
OWNWORD_ECR_URI='YOUR_ACCOUNT_ID.dkr.ecr.ap-southeast-1.amazonaws.com/ownword-lab'
app_root="$HOME/ownword-lab"
OWNWORD_COMPOSE_ARGS=(
  --project-name ownword
  --env-file "$app_root/deploy/lightsail/.env"
  --env-file "$app_root/deploy/lightsail/.secrets/app-rds.env"
  -f "$app_root/deploy/lightsail/compose.yaml"
  -f "$app_root/deploy/lightsail/compose.rds.yaml"
)
EOF
aws ecr describe-images --profile ownword-lab-backup --region ap-southeast-1 \
  --repository-name ownword-lab --query 'imageDetails[].imageDigest'
```

Khi image đầu tiên đã có trên ECR, dùng `crontab -e` với tài khoản `ubuntu` để thêm dòng dưới đây. Giữ lại các tác vụ sao lưu và bổ sung thông tin từ đã có.

```cron
*/2 * * * * PATH=/usr/local/bin:/usr/bin:/bin /usr/bin/timeout 20m "$HOME/.local/bin/ownword-deploy-release" 2>&1 | /usr/bin/logger -t ownword-registry-release # ownword-registry-release
```

Xem `journalctl -t ownword-registry-release -n 30 --no-pager` và đọc `~/.local/state/ownword-release/active-image`. Đối chiếu digest với ECR rồi mở trang chủ và trang đăng nhập công khai. Để kiểm tra lần nữa, sửa một dòng chữ trên trang đăng nhập của lab rồi push. Ghi commit mới, kết quả workflow, digest đang chạy và thay đổi quan sát được.

**Khi phát hành lỗi.** Nếu build lỗi, GitHub không đẩy image. Nếu migration lỗi, ứng dụng cũ tiếp tục chạy. Nếu container mới không khởi động hoặc kiểm tra trang thất bại, script khôi phục image ứng dụng trước đó. Các migration đã hoàn tất vẫn được áp dụng, vì vậy thay đổi lược đồ phải tương thích với ứng dụng trước đó.

[Tiếp theo: Kiểm chứng, ước tính chi phí và dọn lab](../../5.7-verification/)
