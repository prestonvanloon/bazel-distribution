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

def _tgz2zip_impl(ctx):
    ctx.actions.run(
        inputs = [ctx.file.tgz],
        outputs = [ctx.outputs.zip],
        executable = ctx.executable._tgz2zip_py,
        arguments = [ctx.file.tgz.path, ctx.outputs.zip.path, ctx.attr.prefix],
        progress_message = "Converting {} to {}".format(ctx.file.tgz.short_path, ctx.outputs.zip.short_path)
    )

    return DefaultInfo(data_runfiles = ctx.runfiles(files=[ctx.outputs.zip]))


tgz2zip = rule(
    attrs = {
        "tgz": attr.label(
            allow_single_file=[".tar.gz"],
            mandatory = True,
            doc = "Input .tar.gz archive"
        ),
        "output_filename": attr.string(
            mandatory = True,
            doc = 'Resulting filename'
        ),
        "prefix": attr.string(
            default=".",
            doc = 'Prefix of files in archive'
        ),
        "_tgz2zip_py": attr.label(
            default = "//common:tgz2zip",
            executable = True,
            cfg = "host"
        )
    },
    implementation = _tgz2zip_impl,
    outputs = {
        "zip": "%{output_filename}.zip"
    },
    output_to_genfiles = True,
    doc = 'Converts .tar.gz into .zip'
)