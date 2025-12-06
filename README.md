# AWS Bedrock Application Inference Profile - Terraform

このTerraform設定は、AWS Bedrockのアプリケーション推論プロファイルを作成します。

## 前提条件

- Terraform >= 1.0
- AWS CLIの設定（認証情報）
- AWS Bedrockへのアクセス権限

## 使用方法

### 1. 初期化

```bash
terraform init
```

### 2. 変数ファイルの作成

```bash
cp terraform.tfvars.example terraform.tfvars
```

`terraform.tfvars`を編集して、必要な値を設定してください。

### 3. プランの確認

```bash
terraform plan
```

### 4. リソースの作成

```bash
terraform apply
```

### 5. リソースの削除

```bash
terraform destroy
```

## 変数

| 変数名 | 説明 | デフォルト値 |
|--------|------|--------------|
| `aws_region` | AWSリージョン | `us-east-1` |
| `inference_profile_name` | 推論プロファイル名 | `my-inference-profile` |
| `inference_profile_description` | 推論プロファイルの説明 | `Application inference profile for Bedrock` |
| `model_source` | モデルソース | `SYSTEM_DEFINED` |
| `tags` | リソースタグ | `{}` |

## 出力

- `inference_profile_id`: 推論プロファイルのID
- `inference_profile_arn`: 推論プロファイルのARN
- `inference_profile_name`: 推論プロファイル名

## 注意事項

- AWS Bedrockは特定のリージョンでのみ利用可能です
- 使用するモデルに応じて、適切なモデルARNを指定してください
- コストが発生する可能性がありますので、使用後は適切にリソースを削除してください
