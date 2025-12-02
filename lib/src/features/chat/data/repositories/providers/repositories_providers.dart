import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messaging/src/features/chat/data/datasources/hive/providers/hive_provider.dart';
import 'package:messaging/src/features/chat/data/repositories/message_repository_impl.dart';

final messageRepositoryProvider = Provider((ref) => MessageRepository(ref.watch(hiveProvider)));
