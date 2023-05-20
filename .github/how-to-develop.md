# Github Actions

## Test CI locally

```bash
act \
  --secret AWS_ACCESS_KEY_ID \
  --secret AWS_SECRET_ACCESS_KEY \
  --secret AWS_REGION \
  --job auto-update
```

## Test in forked repository

### Set secrets before running

```bash
gh secret set AWS_ACCESS_KEY_ID --body "$AWS_ACCESS_KEY_ID";
gh secret set AWS_SECRET_ACCESS_KEY --body "$AWS_SECRET_ACCESS_KEY";
gh secret set AWS_REGION --body "$AWS_REGION";
gh secret set DOCKER_USERNAME --body "$DOCKER_USERNAME";
gh secret set DOCKER_PASSWORD --body "$DOCKER_PASSWORD";
```
