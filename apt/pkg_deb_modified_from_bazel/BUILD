#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

load("@bazel_skylib//:bzl_library.bzl", "bzl_library")

bzl_library(
    name = "lib",
    srcs = [
        "path.bzl",
        "pkg.bzl"
    ],
    visibility = ["//visibility:public"]
)

py_library(
    name = "archive",
    srcs = ["archive.py"],
    srcs_version = "PY2AND3",
    visibility = ["//visibility:public"],
)

py_binary(
    name = "make_deb",
    srcs = ["make_deb.py"],
    srcs_version = "PY2AND3",
    visibility = ["//visibility:public"],
    deps = [
        ":archive",
        "@bazel_tools//third_party/py/gflags",
    ],
)
