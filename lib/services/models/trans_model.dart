// To parse this JSON data, do
//
//     final transModel = transModelFromJson(jsonString);

import 'dart:convert';

TransModel transModelFromJson(String str) => TransModel.fromJson(json.decode(str));

String transModelToJson(TransModel data) => json.encode(data.toJson());

class TransModel {
    ResponseData responseData;
    bool quotaFinished;
    dynamic mtLangSupported;
    String responseDetails;
    int responseStatus;
    dynamic responderId;
    dynamic exceptionCode;
    List<Match> matches;

    TransModel({
        required this.responseData,
        required this.quotaFinished,
        this.mtLangSupported,
        required this.responseDetails,
        required this.responseStatus,
        this.responderId,
        this.exceptionCode,
        required this.matches,
    });

    factory TransModel.fromJson(Map<String, dynamic> json) => TransModel(
        responseData: ResponseData.fromJson(json["responseData"]),
        quotaFinished: json["quotaFinished"],
        mtLangSupported: json["mtLangSupported"],
        responseDetails: json["responseDetails"],
        responseStatus: json["responseStatus"],
        responderId: json["responderId"],
        exceptionCode: json["exception_code"],
        matches: List<Match>.from(json["matches"].map((x) => Match.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "responseData": responseData.toJson(),
        "quotaFinished": quotaFinished,
        "mtLangSupported": mtLangSupported,
        "responseDetails": responseDetails,
        "responseStatus": responseStatus,
        "responderId": responderId,
        "exception_code": exceptionCode,
        "matches": List<dynamic>.from(matches.map((x) => x.toJson())),
    };
}

class Match {
    dynamic id;
    String segment;
    String translation;
    String source;
    String target;
    dynamic quality;
    dynamic reference;
    int usageCount;
    dynamic subject;
    String createdBy;
    String lastUpdatedBy;
    DateTime createDate;
    DateTime lastUpdateDate;
    num match;

    Match({
        required this.id,
        required this.segment,
        required this.translation,
        required this.source,
        required this.target,
        required this.quality,
        this.reference,
        required this.usageCount,
        required this.subject,
        required this.createdBy,
        required this.lastUpdatedBy,
        required this.createDate,
        required this.lastUpdateDate,
        required this.match,
    });

    factory Match.fromJson(Map<String, dynamic> json) => Match(
        id: json["id"],
        segment: json["segment"],
        translation: json["translation"],
        source: json["source"],
        target: json["target"],
        quality: json["quality"],
        reference: json["reference"],
        usageCount: json["usage-count"],
        subject: json["subject"],
        createdBy: json["created-by"],
        lastUpdatedBy: json["last-updated-by"],
        createDate: DateTime.parse(json["create-date"]),
        lastUpdateDate: DateTime.parse(json["last-update-date"]),
        match: (json["match"] as num).toInt() ,

    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "segment": segment,
        "translation": translation,
        "source": source,
        "target": target,
        "quality": quality,
        "reference": reference,
        "usage-count": usageCount,
        "subject": subject,
        "created-by": createdBy,
        "last-updated-by": lastUpdatedBy,
        "create-date": createDate.toIso8601String(),
        "last-update-date": lastUpdateDate.toIso8601String(),
        "match": match,
    };
}

class ResponseData {
    String translatedText;
    num match;

    ResponseData({
        required this.translatedText,
        required this.match,
    });

    factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
        translatedText: json["translatedText"],
        match: (json["match"] as num).toInt(),
 
    );

    Map<String, dynamic> toJson() => {
        "translatedText": translatedText,
        "match": match,
    };
}
