// To parse this JSON data, do
//
//     final bookingModel = bookingModelFromMap(jsonString);

import 'dart:convert';

class BookingModel {
  BookingModel({
    this.success,
    this.message,
    this.error,
    this.data,
  });

  final int? success;
  final String? message;
  final List<dynamic>? error;
  final Data? data;

  factory BookingModel.fromJson(String str) =>
      BookingModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BookingModel.fromMap(Map<String, dynamic> json) => BookingModel(
        success: json["success"] == null ? null : json["success"]!,
        message: json["message"] == null ? null : json["message"]!,
        error: json["error"] == null
            ? null
            : List<dynamic>.from(json["error"].map((x) => x)),
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success == null ? null : success!,
        "message": message == null ? null : message!,
        "error":
            error == null ? null : List<dynamic>.from(error!.map((x) => x)),
        "data": data == null ? null : data!.toMap(),
      };
}

class Data {
  Data({
    this.pending,
  });

  final List<Pending>? pending;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        pending: json["pending"] == null
            ? null
            : List<Pending>.from(
                json["pending"].map((x) => Pending.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "pending": pending == null
            ? null
            : List<dynamic>.from(pending!.map((x) => x.toMap())),
      };
}

class Pending {
  Pending({
    this.id,
    this.jobId,
    this.total,
    this.tax,
    this.taxRate,
    this.subTotal,
    this.baseFare,
    this.userId,
    this.totalHelpers,
    this.days,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.job,
  });

  final int? id;
  final int? jobId;
  final String? total;
  final String? tax;
  final String? taxRate;
  final String? subTotal;
  final String? baseFare;
  final int? userId;
  final int? totalHelpers;
  final int? days;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Job? job;

  factory Pending.fromJson(String str) => Pending.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pending.fromMap(Map<String, dynamic> json) => Pending(
        id: json["id"] == null ? null : json["id"]!,
        jobId: json["job_id"] == null ? null : json["job_id"]!,
        total: json["total"] == null ? null : json["total"]!,
        tax: json["tax"] == null ? null : json["tax"]!,
        taxRate: json["tax_rate"] == null ? null : json["tax_rate"]!,
        subTotal: json["sub_total"] == null ? null : json["sub_total"]!,
        baseFare: json["base_fare"] == null ? null : json["base_fare"]!,
        userId: json["user_id"] == null ? null : json["user_id"]!,
        totalHelpers:
            json["total_helpers"] == null ? null : json["total_helpers"]!,
        days: json["days"] == null ? null : json["days"]!,
        status: json["status"] == null ? null : json["status"]!,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        job: json["job"] == null ? null : Job.fromMap(json["job"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id!,
        "job_id": jobId == null ? null : jobId!,
        "total": total == null ? null : total!,
        "tax": tax == null ? null : tax!,
        "tax_rate": taxRate == null ? null : taxRate!,
        "sub_total": subTotal == null ? null : subTotal!,
        "base_fare": baseFare == null ? null : baseFare!,
        "user_id": userId == null ? null : userId!,
        "total_helpers": totalHelpers == null ? null : totalHelpers!,
        "days": days == null ? null : days!,
        "status": status == null ? null : status!,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "job": job == null ? null : job!.toMap(),
      };
}

class Job {
  Job({
    this.id,
    this.name,
    this.address,
    this.containerId,
    this.packageType,
    this.imageFile,
    this.voiceFile,
    this.startTime,
    this.endTime,
    this.userId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.instructions,
    this.latitude,
    this.longitude,
    this.approvedBy,
    this.packages,
    this.helpers,
    this.trackers,
    this.container,
  });

  final int? id;
  final String? name;
  final String? address;
  final int? containerId;
  final String? packageType;
  final String? imageFile;
  final String? voiceFile;
  final DateTime? startTime;
  final DateTime? endTime;
  final int? userId;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic instructions;
  final double? latitude;
  final double? longitude;
  final dynamic approvedBy;
  final List<dynamic>? packages;
  final List<dynamic>? helpers;
  final List<dynamic>? trackers;
  final Containerr? container;

  factory Job.fromJson(String str) => Job.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Job.fromMap(Map<String, dynamic> json) => Job(
        id: json["id"] == null ? null : json["id"]!,
        name: json["name"] == null ? null : json["name"]!,
        address: json["address"] == null ? null : json["address"]!,
        containerId:
            json["container_id"] == null ? null : json["container_id"]!,
        packageType:
            json["package_type"] == null ? null : json["package_type"]!,
        imageFile: json["image_file"] == null ? null : json["image_file"]!,
        voiceFile: json["voice_file"] == null ? null : json["voice_file"]!,
        startTime: json["start_time"] == null
            ? null
            : DateTime.parse(json["start_time"]),
        endTime:
            json["end_time"] == null ? null : DateTime.parse(json["end_time"]),
        userId: json["user_id"] == null ? null : json["user_id"]!,
        status: json["status"] == null ? null : json["status"]!,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        instructions: json["instructions"],
        latitude:
            json["latitude"] == null ? null : double.parse(json["latitude"]),
        longitude:
            json["longitude"] == null ? null : double.parse(json["longitude"]),
        approvedBy: json["approved_by"],
        packages: json["packages"] == null
            ? null
            : List<dynamic>.from(json["packages"].map((x) => x)),
        helpers: json["helpers"] == null
            ? null
            : List<dynamic>.from(json["helpers"].map((x) => x)),
        trackers: json["trackers"] == null
            ? null
            : List<dynamic>.from(json["trackers"].map((x) => x)),
        container: json["container"] == null
            ? null
            : Containerr.fromMap(json["container"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id!,
        "name": name == null ? null : name!,
        "address": address == null ? null : address!,
        "container_id": containerId == null ? null : containerId!,
        "package_type": packageType == null ? null : packageType!,
        "image_file": imageFile == null ? null : imageFile!,
        "voice_file": voiceFile == null ? null : voiceFile!,
        "start_time": startTime == null ? null : startTime!.toIso8601String(),
        "end_time": endTime == null ? null : endTime!.toIso8601String(),
        "user_id": userId == null ? null : userId!,
        "status": status == null ? null : status!,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "instructions": instructions,
        "latitude": latitude == null ? null : latitude!,
        "longitude": longitude == null ? null : longitude!,
        "approved_by": approvedBy,
        "packages": packages == null
            ? null
            : List<dynamic>.from(packages!.map((x) => x)),
        "helpers":
            helpers == null ? null : List<dynamic>.from(helpers!.map((x) => x)),
        "trackers": trackers == null
            ? null
            : List<dynamic>.from(trackers!.map((x) => x)),
        "container": container == null ? null : container!.toMap(),
      };
}

// enum Address { LAHORE, LAHORE_PAKISTAN, THE_101_HALL_ROAD_LAHORE }

// final addressValues = EnumValues({
//   "lahore": Address.LAHORE,
//   "Lahore, Pakistan": Address.LAHORE_PAKISTAN,
//   "101 hall road lahore": Address.THE_101_HALL_ROAD_LAHORE
// });

class Containerr {
  Containerr({
    this.id,
    this.name,
    this.helperSize,
    this.type,
    this.size,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? name;
  final int? helperSize;
  final String? type;
  final int? size;
  final int? status;
  final dynamic createdAt;
  final dynamic updatedAt;

  factory Containerr.fromJson(String str) =>
      Containerr.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Containerr.fromMap(Map<String, dynamic> json) => Containerr(
        id: json["id"] == null ? null : json["id"]!,
        name: json["name"] == null ? null : json["name"]!,
        helperSize: json["helper_size"] == null ? null : json["helper_size"]!,
        type: json["type"] == null ? null : json["type"]!,
        size: json["size"] == null ? null : json["size"]!,
        status: json["status"] == null ? null : json["status"]!,
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id!,
        "name": name == null ? null : name!,
        "helper_size": helperSize == null ? null : helperSize!,
        "type": type == null ? null : type!,
        "size": size == null ? null : size!,
        "status": status == null ? null : status!,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

// enum ContainerName { CONTAINE_20_FEET, CONTAINE_40_FEET }
//
// final containerNameValues = EnumValues({
//   "Containe 20 feet": ContainerName.CONTAINE_20_FEET,
//   "Containe 40 feet": ContainerName.CONTAINE_40_FEET
// });
//
// enum JobName { JOB5, ABC, WANT_TO_UNLOAD_MY_CONTAINER }
//
// final jobNameValues = EnumValues({
//   "abc": JobName.ABC,
//   "job5": JobName.JOB5,
//   "Want to unload my container": JobName.WANT_TO_UNLOAD_MY_CONTAINER
// });
//
// enum PackageType { BOX, BOXES_PALETS }
//
// final packageTypeValues = EnumValues({
//   "box": PackageType.BOX,
//   "Boxes,palets": PackageType.BOXES_PALETS
// });
//
//
// final statusValues = EnumValues({
//   "pending": Status.PENDING
// });

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
