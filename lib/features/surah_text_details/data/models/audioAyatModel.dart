class AudioModel {
  final dynamic status;
  final String message;
  final List<AudioInfo> data;

  AudioModel({
    required this.status,
    required this.message,
   required this.data,
  });
  factory AudioModel.fromJson(dynamic json)
  {
    List<AudioInfo>audios=[];
   json['data'].map((e){
     audios.add(AudioInfo.fromJson(e));
   }).toList();
    return AudioModel(
      status: json['status'],
      message: json['message'],
     data: audios,
    );
  }
}

class AudioInfo {
  final int number;
  final int ayahCount;
  final Asma asma;
  final TypeSura type;
  final Recitation recitation;

  AudioInfo( {
    required this.type,
    required this.recitation,
   required  this.asma,
    required this.number,
    required this.ayahCount,
  });
  factory AudioInfo.fromJson(dynamic json)
  {
    return AudioInfo(type: TypeSura.fromJson(json['type']),
        recitation: Recitation.fromJson(json['recitation']),
      asma: Asma.fromJson(json['asma']),
      number: json['number'], ayahCount: json['ayahCount'],);
  }
}
class Asma{
final Ar ar;

  Asma({required this.ar});
  factory Asma.fromJson(dynamic json)
  {
    return Asma(ar: Ar.fromJson(json['ar']));
  }
}
class Ar{
  final String short;


  Ar({required this.short});
  factory Ar.fromJson(dynamic json)
  {
    return Ar(short: json['short'],
   );
  }
}
class TypeSura{
   String en;

  factory TypeSura.fromJson(dynamic json)
  {
    return TypeSura(en: json['en']);
  }

  TypeSura({required this.en});
}
class Recitation{
  final String full;

  Recitation({ required this.full});
  factory Recitation.fromJson(dynamic json)
  {
    return Recitation(full: json['full']);
  }

}
