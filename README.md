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

`terraform.tfvars`を編集して、必要な値を設定してください。`source_inference_profile_arn` の `<ACCOUNT_ID>` は自分のAWSアカウントIDに置き換えます（tfvars は `.gitignore` 済みでコミットされません）。

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
| `aws_region` | AWSリージョン | `ap-northeast-1` |
| `source_inference_profile_arn` | コピー元のシステム定義推論プロファイルARN | なし（必須） |
| `inference_profile_name` | 推論プロファイル名 | `my-inference-profile` |
| `inference_profile_description` | 推論プロファイルの説明 | `Application inference profile for Bedrock` |
| `tags` | リソースタグ | `Environment=development`, `ManagedBy=terraform` |

## 出力

- `inference_profile_id`: 推論プロファイルのID
- `inference_profile_arn`: 推論プロファイルのARN
- `inference_profile_name`: 推論プロファイル名

## 注意事項

- AWS Bedrockは特定のリージョンでのみ利用可能です
- 使用するモデルに応じて、適切なモデルARNを指定してください
- コストが発生する可能性がありますので、使用後は適切にリソースを削除してください

## 学んだこと

- アプリケーション推論プロファイルは `model_source.copy_from` にシステム定義プロファイル（例: `jp.anthropic.claude-sonnet-4-5-...` のクロスリージョンプロファイル）のARNを指定して作成する。
- ARNにはAWSアカウントIDが含まれるため、コードにハードコードせず変数（tfvars）で渡す。
