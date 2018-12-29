--!A cross-platform build utility based on Lua
--
-- Licensed to the Apache Software Foundation (ASF) under one
-- or more contributor license agreements.  See the NOTICE file
-- distributed with this work for additional information
-- regarding copyright ownership.  The ASF licenses this file
-- to you under the Apache License, Version 2.0 (the
-- "License"); you may not use this file except in compliance
-- with the License.  You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- 
-- Copyright (C) 2015 - 2018, TBOOX Open Source Group.
--
-- @author      ruki
-- @file        check_cuda.lua
--

-- imports
import("core.base.option")
import("detect.sdks.find_cuda")

-- check the cuda sdk toolchains
function main(config)

    -- get the cuda directory
    local cuda_dir = config.get("cuda")
    if not cuda_dir then

        -- check ok? update it
        local toolchains = find_cuda()
        if toolchains then

            -- save it
            config.set("cuda", toolchains.cudadir)

            -- trace
            cprint("checking for the Cuda SDK directory ... ${green}%s", toolchains.cudadir)
        end
    end
end
