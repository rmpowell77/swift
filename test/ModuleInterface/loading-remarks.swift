/// Test the -Rmodule-loading flag.
// RUN: %empty-directory(%t)

/// Create a simple module and interface.
// RUN: echo 'public func publicFunction() {}' > %t/TestModule.swift
// RUN: %target-swift-emit-module-interface(%t/TestModule.swiftinterface) %t/TestModule.swift

/// Use -Rmodule-loading in a client and look for the diagnostics output.
// RUN: %target-swift-frontend -typecheck %s -I %t -Rmodule-loading 2>&1 | %FileCheck %s

import TestModule
// CHECK: remark: loaded module at {{.*}}SwiftShims-{{.*}}.pcm
// CHECK: remark: loaded module at {{.*}}Swift.swiftmodule{{.*}}.swiftmodule
// CHECK: remark: loaded module at {{.*}}TestModule.swiftinterface
