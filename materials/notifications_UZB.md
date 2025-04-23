## GitLab CI & Telegram

- Telegram bot yaratish;
- Botga xabar yuborish, u foydalanuvchi (siz) bilan ishlashga sozlanishi uchun;
- Kerakli qiymatlarni GitLab-da saqlash:
  - Kerakli omborning *Settings*i;
  - **CI/CD** bandi;
  - *Secret variables*;
  - Yaratilgan bot tokenini *TELEGRAM_BOT_TOKEN* oʻzgaruvchisida saqlash;
  - Bildirishnomalar yuboriladigan foydalanuvchi IDsi *TELEGRAM_USER_ID* da saqlash.

Bildirishnomalarni qulay yuborish uchun API Telegramga murojaat qiladigan va yaratilgan bot orqali kerakli foydalanuvchiga xabar yuboradigan bash skriptini yaratish kerak. Mana bunday skriptga misol:

```bash
URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"
TEXT="Deploy status: $1%0A%0AProject:+$CI_PROJECT_NAME%0AURL:+$CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/%0ABranch:+$CI_COMMIT_REF_SLUG"

curl -s --max-time $TIME -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null
```

P.S. Deploy statusi ushbu skriptga birinchi parametr sifatida o'tkazilishi kerak.