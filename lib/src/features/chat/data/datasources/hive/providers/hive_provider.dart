import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messaging/src/features/chat/data/datasources/hive/hive_datasource.dart';

final hiveProvider = Provider((ref) => HiveDatasource());
