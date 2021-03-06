#
# Cookbook Name:: cq
# Recipe:: _osgi_bundles
#
# Copyright (C) 2015 Jakub Wadolowski
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

Chef::Log.warn(
  'This is a test recipe and must not be used outside of test kitchen!'
)

# Stop action
# -----------------------------------------------------------------------------

# Bundle in Active state
cq_osgi_bundle 'com.day.crx.crxde-support' do
  username node['cq']['author']['credentials']['login']
  password node['cq']['author']['credentials']['password']
  instance "http://localhost:#{node['cq']['author']['port']}"
  same_state_barrier 3
  sleep_time 5

  action :stop
end

# Bundle in Active state, but with explicitly defined symbolic name
cq_osgi_bundle 'Author: org.apache.sling.jcr.webdav' do
  symbolic_name 'org.apache.sling.jcr.webdav'
  username node['cq']['author']['credentials']['login']
  password node['cq']['author']['credentials']['password']
  instance "http://localhost:#{node['cq']['author']['port']}"
  same_state_barrier 3
  sleep_time 5

  action :stop
end

# Start action
# -----------------------------------------------------------------------------

# Start of fragmented bundle
cq_osgi_bundle 'org.apache.sling.fragment.ws' do
  username node['cq']['author']['credentials']['login']
  password node['cq']['author']['credentials']['password']
  instance "http://localhost:#{node['cq']['author']['port']}"

  action :start
end

# Start of already Active bundle
cq_osgi_bundle 'pdfcore' do
  username node['cq']['author']['credentials']['login']
  password node['cq']['author']['credentials']['password']
  instance "http://localhost:#{node['cq']['author']['port']}"

  action :start
end
