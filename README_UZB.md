# Basic CI/CD

*SimpleBashUtils* loyihasi uchun oddiy **Cl/CD** ishlab chiqish. Yig’ish, sinab ko'rish, kengaytirish.

💡 Ushbu loyiha bo’yicha fikr-mulohazalaringizni biz bilan baham ko'rish uchun [shu yerga bosing](https://new.oprosso.net/p/4cb31ec3f47a4596bc758ea1861fb624). Bu anonim va jamoamizga mashg’ulotlarni yaxshilashga yordam beradi. Loyihani bajarib bo’lgandan so'ng darhol so'rovnomani to'ldirishni tavsiya qilamiz. 

## Contents

1. [Chapter I](#chapter-i)
2. [Chapter II](#chapter-ii) \
  2.1. [CI/CD asoslari](#cicd-asoslari) \
  2.2. [CI asoslari](#ci-asoslari) \
  2.3. [CD asoslari](#cd-asoslari)
3. [Chapter III](#chapter-iii) \
  3.1. [gitlab-runner ni sozlash](#part-1-gitlab-runner-ni-sozlash)  \
  3.2. [Yig'ish ](#part-2-yigish)  \
  3.3. [Kodstayl testi](#part-3-kodstayl-testi)   \
  3.4. [Integratsiya testlari](#part-4-integratsiya-testlari)  \
  3.5. [Deploy bosqichi](#part-5-deploy-bosqichi)  \
  3.6. [Qo'shimcha. Bildirishnomalar](#part-6-qoshimcha-bildirishnomalar)
4. [Chapter IV](#chapter-iv)

## Chapter I

![basic_ci_cd](misc/images/basic_ci_cd.JPG)

Yer sayyorasi, ASI kompaniyasi ofisi, bugungi kunlar.

London portiga kelganingizdan so'ng sizda joylashib olish va shahar bo'ylab biroz sayr qilish uchun bir necha kun bor edi. Va nihoyat, siz yangi ishni boshlashga va’dalashgan kun keladi.

Bugun siz tumanli Albionga kelishingizga sababchi bo’lgan kompaniya ofisining eshigi oldiga taksida yetib borasiz.

London sohillariga kelib to’xtagan kuningizda qabul qilgan xatingizda eshik kodi va kabinetingiz raqami bor edi.

Bo'sh koridorlar va suv quygandek jimjitlikdan hayratlangancha, siz ish joyingizni osongina topishingiz mumkin bo'lgan bir necha qavat pastga tushasiz.

U yerda siz yaqinda ishga tushirilgan kompyuterni va butunlay achinarli holatdagi ichki aloqa apparatini topasiz.

Kirishingiz va eshikni orqangizdan yopishingiz bilanoq, apparatdan robotlashtirilgan ovoz keladi:

`-` ASI laboratoriyasining kompyuterlashtirilgan eksperimental markaziga xush kelibsiz. Organizmingizning xususiyatlarini tahlil qilish o’z nihoyasiga yetdi. Biz boshlashga tayyormiz. Siz bizning eksperimental markazimizning loyihalaridan birini qo'llab-quvvatlashda ishtirok etasiz. Sizning birinchi vazifangiz hammaga tanish **cat** va **grep** utilitalari uchun CI/CD yaratish bo'ladi.

`-` Ishga kirishishdan oldin shuni eslatib o'tamizki, eksperimental markazning asosiy tamoyili o'yinga asoslangan ta'lim bo'lsa-da, biz shikastlanish va jarohatlar bo’lmasligiga kafolat bermaymiz. O'zingizning va boshqalarning xavfsizligi uchun hech narsaga tegmang.

## Chapter II

`-` Birinchi vazifangiz birmuncha tushuntirishni talab qiladi. Sizni ish bilan tezda tanishtirib o’tishimga ruxsat bering.

*Siz keyingi gapdan faqat eng asosiy ma'lumotlarni ko’rib chiqishga muvaffaq bo'ldingiz, chunki u sezishim bo’yicha, besh marta tezlashtirilgan edi.*

### **CI/CD** asoslari

Afsuski... Agar biror narsa doimo "qo'lda" qilinsa, u yoki yomon ishlaydi, yo umuman bo'lmaydi.

**CI/CD** – bu dasturiy ta'minotni o'zgartirishni tez-tez va ishonchli tarzda kengaytirish imkonini beruvchi prinsiplar va amaliyotlar to'plami.

**CI/CD** dan foydalanish sabablari:
- Jamoaviy ishlab chiqish;
- Dasturiy ta'minotning uzoq ishlash sikli;
- Reliz siklining qisqarishi;
- Katta tizimlarni kengaytirish va sinovdan o'tkazishda qiyinchilik;
- Inson omili.

**CI/CD** pipeline – bu ombordagi kodning ma'lum bir versiyasi uchun harakatlar (skriptlar) ketma-ketligi bo'lib, u o'zgartirishlar kiritilganda avtomatik ravishda ishga tushadi.

### **CI** asoslari

**Cl** (Continuous Integration) – so'zma-so'z "uzluksiz integratsiya" deb tarjima qilinadi.
Bunda ilova kodining alohida qismlarini o’zaro integratsiyalash nazarda tutiladi.
**CI** odatda quyida tavsiflangan ikkita vazifani bajaradi.

- BUILD
    - Kodning umuman yig’ilishini tekshiramiz;
    - Keyingi bosqichlar uchun artefaktlarni tayyorlaymiz.

- TEST
    - Kodstayl testlari;
    - Modul testlari;
    - Integratsiya testlari;
    - Sizda mavjud bo'lgan boshqa testlar;
    - Testlar haqida hisobotlar.

### CD asoslari

**CD** (Continuous Delivery) – uzluksiz integratsiyaning kengaytmasi hisoblanadi, chunki u yig’ish bosqichidan keyin barcha kod o'zgarishlarini sinov va/yoki ishlab chiqarish muhitiga avtomatik ravishda kengaytiradi.
**CD** quyida tavsiflangan vazifalarni bajarishi mumkin.

- PUBLISH (kengaytirish uchun doker ishlatiladigan holda):
    - konteynerlarning obrazlarini yig'amiz;
    - Obrazlarni keyinchalik kengaytirish uchun oladigan joyga push qilamiz.
- UPDATE CONFIGS:
  - Mashinalardagi konfiguratsiyani yangilaymiz.
- DEPLOY STAGING:
    - Qo'lda testlar, QA va boshqa avtomatlashtirilmagan tekshiruvlar uchun test muhitini kengaytirish;
    - CI bosqichlaridan muvaffaqiyatli o’tilgandan so'ng qo'lda yoki avtomatik ravishda ishga tushirilishi mumkin.
- DEPLOY PRODUCTION:
    - Tizimning yangi versiyasini “prodakshn”ga kengaytiramiz;
    - Ushbu bosqichni avtomatik ravishda emas, balki qo'lda ishga tushirish tavsiya etiladi;
    - Xohishga ko’ra, uni faqat omborning ma'lum bir tarmog’i uchun sozlash mumkin (master, release va boshqalar).

`-` Xo'sh, hammasi shu. Agar sizda biror savol yuzaga kelsa, mening aytganlarimni sekinroq tezlikda boshingizda takrorlang. Tezda qaytaman.

## Chapter III

Ishingiz natijasi sifatida siz quyida tavsiflangan ikkita virtual mashina obrazi dampini saqlashingiz kerak. \
**P.S. Git-ga hech qachon damplarni saqlamang!**

### Part 1. **gitlab-runner** ni sozlash

`-` CI/CD bilan shug’ullanishga qaror qilgan ekansiz, demak, siz haqiqatan ham test qilishni juda juda yaxshi ko'rsangiz kerak. Men ham yaxshi ko'raman. Shunday ekan, qani, boshlaymiz. Agar sizga biror ma'lumot kerak bo'lsa, rasmiy hujjatlarda javoblarni izlashni maslahat beraman

**== Topshiriq ==**

##### *Ubuntu Server 22.04 LTS* virtual mashinasini ko’taring.
*Loyihaning oxirida virtual mashina obrazining dampini saqlash kerakligiga tayyor bo'ling.*

##### Virtual mashinaga **gitlab-runner** yuklab oling va o'rnating.**

##### **gitlab-runner** dasturini ishga tushiring va uni joriy loyihada foydalanish uchun ro'yxatdan o'tkazing (*D06_CICD*).** 
- Ro'yxatdan o'tish uchun sizga platformadagi topshiriq sahifasida olish mumkin bo'lgan URL va token kerak bo'ladi.

### Part 2. Yig'ish 

`-` Предыдущее испытание было создано, чтобы повышать в людях уверенность в себе.
Теперь я подкорректировала тесты, сделав их более сложными и менее льстивыми.

**== Topshiriq ==**

*SimpleBashUtils* loyihasidan ilovalar yig’ish bo’yicha **CI** uchun bosqich yozing.

_.gitlab-ci.yml_ faylida _SimpleBashUtils_ loyihasidan meyk fayli orqali yig’ishni ishga tushirish bosqichini qo'shing.

Yig'ishdan so'ng olingan fayllarni (artefaktlarni) 30 kun saqlash muddati bilan ixtiyoriy direktoriyaga saqlang.

**Agar SimpleBashUtils dasturi bajarilmagan bo'lsa**

*DO* papkasidan dasturni tuzish uchun **CI** uchun bosqich yoz.

_.gitlab-ci.yml_ faylida code-samples papkasidan meyk fayli orqali tuzishni boshlash bosqichini qo'sh.

Tuzishdan keyin olingan fayllar (artefaktlar) 30 kundan keyin o'chiriladigan istalgan katmandagi saqlanadigan.

### Part 3. Kodstayl testi

`-` Tabriklayman, siz mutlaqo bema’ni vazifani bajardingiz. Hazil. U barcha keying vazifalarga o'tish uchun kerak edi.

**== Topshiriq ==**

#### Kodstayl skriptini (*clang-format*) ishga tushiradigan **CI** uchun bosqich yozing.

##### Agar kodstayl o'tmagan bo'lsa, payplaynni "feyl" qiling.

##### Payplaynda *сlang-format* utilitaning chiqishini aks ettiring.

### Part 4. Integratsiya testlari

`-` Ajoyib, kodstayl testi yozildi. [OHISTA] Siz bilan tet-a-tet gaplashaman. Hamkasblaringizga hech narsa demang. Oramizda qolsin: siz juda yaxshi uddasidan chiqyapsiz. [BALANDROQ] Integratsiya testlarini yozishga o'tamiz.

**== Topshiriq ==**

#### Xuddi shu **CI** bosqichini yozing, ki, u integratsiya testlarini ishga tushursin.

##### *SimpleBashUtils* loyihasi uchun o'zing yozgan integratsiya testlarini olishing mumkin.

##### code-samples papkasidagi loyiha uchun o'z vaqtida integratsiya testlarini yozing. Testlar har qanday tilda (c, bash, python va boshqalar.) yozilishi va tuzilgan dasturni turli holatlarda uning ishlashini tekshirish uchun chaqirishi mumkin.

##### Kodstaylni yig'ish va sinovdan o'tkazish muvaffaqiyatli bo'lsagina, ushbu bosqichni avtomatik ravishda ishga tushiring.

##### Agar testlardan o'tilmagan bo'lsa, payplaynni "feyl" qiling.

##### Payplaynda integratsiya testlaridan o'tilganlik / muvaffaqiyatsiz bo'lganlik bo'yicha chiqishni aks ettiring.

### Part 5. Deploy bosqichi

`-` Ushbu topshiriqni yakunlash uchun siz bajariladigan fayllarni prodakshn rolini o'ynaydigan boshqa virtual mashinaga o'tkazishingiz kerak. Omad.

**== Topshiriq ==**

##### Ikkinchi *Ubuntu Server 22.04 LTS* virtual mashinasini ko’taring.

#### Loyihani boshqa virtual mashinaga "kengaytiradigan" **CD** uchun bosqich yozing.

##### Oldingi barcha bosqichlar muvaffaqiyatli bo'lishi sharti bilan ushbu bosqichni qo'lda ishga tushiring.

##### **ssh** va **scp** foydalanib, yig’ishdan so'ng olingan fayllarni (artefaktlar) ikkinchi virtual mashinaning */usr/local/bin* direktoriyasiga ko'chiruvchi bash skriptini yozing.
*Bu yerda sizga D02_LinuxNetwork loyihasida olingan bilimlar yordam berishi mumkin.*

- O'tkazish qanday sodir bo'lishini script bo’yicha tushuntirishga tayyor bo'ling.

##### _.gitlab-ci.yml_ faylida yozma skriptni ishga tushirish bosqichini qo'shing.**

##### Xato holatida, payplaynni "feyl" qiling.*

Natijada, ikkinchi virtual mashinada *SimpleBashUtils* loyihasidan (*cat* va *grep*) yoki code-samples papkasidan (*DO*) foydalanishga tayyor ilova olishingiz kerak (bu, siz nima qildingizga bog'liq).

##### Virtual mashinalarning obrazlari dampini saqlang.
**P.S. Git-ga hech qachon damplarni saqlamang!**
- Repozitoriydagi so'nggi kommitga ega bo’lgan payplaynni ishga tushirishni unutmang.

### Part 6. Qo'shimcha. Bildirishnomalar

`-` Bu yerda sizning navbatdagi topshirig'ingiz Nobel laureatlari uchun maxsus bajarilayotgani yozilgan. Ular mukofotni nima sababdan olgani bu yerda aytilmagan, lekin aniq **gitlab-runner** bilan ishlash qobiliyati uchun emas.

**== Topshiriq ==**

#### **Telegram** “[sizning nickname] D06 CI/CD” nomli bot orqali payplaynning muvaffaqiyatli/muvaffaqiyatsiz bajarilganligi haqida bildirishnoma sozlang.

- Bildirishnoma matnida **CI** va **CD** bosqichlarining muvaffaqiyatli o’tilganligi haqidagi ma'lumotlar bo'lishi kerak.
- Qolgan bildirishnoma matni ixtiyoriy bo'lishi mumkin.

## Chapter IV

`-` Yaxshi. Bir qator topshiriqlarni bajargandan so'ng, xodim dam olish xonasiga borishi kerak.

Dam olish xonasida bo'sh daqiqangiz bo'lganda, siz bir vaqtning o'zida sodir bo'layotgan voqealarning g'alatiligini o'ylab, pochtangizni tekshirishga qaror qilasiz.

Telefoningizni olishga ulgurar-ulgurmas, dam olish xonasiga boshqa bir odam kirdi.

`-` Salom, men seni bu yerda oldin ko'rmaganman.

`-` Ko'rganingda g'alati bo’lgan bo'lardi. Bu mening birinchi kunim, haha.

`-` O, birinchi kun! Xo'sh, bizning "bossimiz" haqida qanday fikrdasan? — soʻnggi soʻzlar yaqqol kinoya bilan aytildi.

`-` U boss edimi? Menimcha, faqat men uni g'alati deb bilmasam kerak... va biroz qo'polroq ham? Men Angliyada hammangizni shundaysizlar, deb o'ylab qoldim.

`-` Ahah, hecham bundaymas, do'stim. Bu shunchaki yangi boshlovchilar uchun hazil, lekin xavotirlanma, ertaga hammasi yaxshi bo'ladi. Aytgancha, ana haqiqiy boss kelyapti, menimcha, sening oldingga. Mayli, omad, yana ko'rishamiz.

Notanish odam tezda ko'zdan g'oyib bo'ldi va xonaga 50-60 yoshlardagi qimmatbaho kostyum kiygan, ikki chakkasidagi sochi biroz to’kilgan, past bo’yli bir odam kirib keldi. Gap boshlashingizni kutmasdan, u nozik, zo'rg'a seziladigan tabassum bilan dedi:

`-` O, siz Tomas bo'lsangiz kerak. Haqiqatan ham test ishining ajoyib bajarilishi. Umid qilamanki, siz bizning sevimli do'stimiz kichik ASI dan qo'rqmadingiz, u siz haqingizda yaxshi gaplar gapirdi. Shunday qilib, men sizga bu yerda nima qilayotganimiz va kompaniyamizdagi sizning rolingiz haqida ko'proq aytib beraman ...
