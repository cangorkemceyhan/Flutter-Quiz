import 'soru.dart';
class testVeri{

  int _soruIndex=0;

  List <Soru> _soruBankasi=[
    Soru(soruMetni: "Stateful Widget, durumu tutabilen ve güncelleyebilen bir widget türüdür",
        soruYaniti: true),
    Soru(soruMetni: "Sabit bit içeriği olan widgetlar “Inherited Widget” olarak oluşturulabilir",
        soruYaniti: false),
    Soru(soruMetni: "Her widget, build() metodunu kullanarak kendisini oluşturur ve günceller",
        soruYaniti: true),
    Soru(soruMetni: "setState() Stateful widgetlerde durum güncellemeleri için kullanılan yöntemdir",
        soruYaniti: true),
    Soru(soruMetni: "BloC mimarisi veri akışını kontrol edemez",
        soruYaniti: false),
    Soru(soruMetni: "GetX basit ve hızlı bir state management paketidir",
        soruYaniti: true),
    Soru(soruMetni: "AnimationController başlangıç ve bitiş değeri için geçiş yapmak için kullanılır",
        soruYaniti: false),
    Soru(soruMetni: "AnimatedWidget animasyon süresini ve durumları kontrol etmek için kullanılır",
        soruYaniti: false)
  ];

  String getSoruMetni(){
  return _soruBankasi[_soruIndex].soruMetni;
  }

  bool getSoruYaniti(){
    return _soruBankasi[_soruIndex].soruYaniti;
  }

  void sonrakiSoru(){
    if(_soruIndex+1<_soruBankasi.length)
    {_soruIndex++;}
  }

  bool oyunSonu() {
    if (_soruIndex + 1 >= _soruBankasi.length) {
      return true;
    }
    else {
      return false;
    }
  }


    void testiSifirla(){
      _soruIndex=0;
    }
  }

