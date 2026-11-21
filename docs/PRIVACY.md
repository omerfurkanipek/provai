# provAi Gizlilik Politikası

Son güncelleme: 21 Kasım 2026

provAi bir demo uygulamadır. Bu sayfa hangi verinin nereye gittiğini açıklar.

## Cihazda kalan veriler

Onboarding cevaplarınız (isim, hedef pozisyon, seviye, tercih edilen dil), prova geçmişiniz, tema tercihiniz ve demo abonelik durumunuz yalnızca cihazınızda saklanır. Profil ekranındaki "Verilerimi sıfırla" ile hepsini silebilirsiniz.

## Ses

Sesli cevaplar cihazınızın konuşma tanıma servisiyle metne çevrilir. provAi ses kaydını sunucuya göndermez veya saklamaz; yalnızca metin transkripti değerlendirme için gönderilir.

## Sunucuya gönderilen veriler

Soru üretmek ve cevapları değerlendirmek için iş ilanı metni, cevap transkripti, hedef pozisyon, seviye ve mülakat dili Supabase üzerindeki bir sunucu fonksiyonuna, oradan da Google Gemini API'sine gönderilir. Uygulama, istekleri sınırlamak için anonim bir oturum kimliği kullanır; ad, e-posta veya telefon numarası toplanmaz.

Google Gemini API'nin ücretsiz katmanında Google, gönderilen içeriği ürünlerini geliştirmek için kullanabilir. Bu yüzden ilan ve cevaplara kişisel veya gizli bilgi eklememenizi öneririz.

## İletişim

https://github.com/omerfurkanipek/provai
