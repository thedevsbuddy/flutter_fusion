import 'dart:isolate';

import 'package:easy_isolate/easy_isolate.dart';

class IsolateWorker {
  IsolateWorker() {
    init();
  }

  final worker = Worker();

  /// Initiate the worker (new thread) and start listen from messages between
  /// the threads
  Future<void> init() async {
    await worker.init(
      mainMessageHandler,
      isolateMessageHandler,
      errorHandler: print,
    );
    // worker.sendMessage();
  }

  /// Send to isolate
  void send(dynamic data) {}
}

/// Handle the messages coming from the isolate
void mainMessageHandler(dynamic data, SendPort isolateSendPort) {}

/// Handle the messages coming from the main
void isolateMessageHandler(dynamic data, SendPort mainSendPort, SendErrorFunction sendError) async {}
