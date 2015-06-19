class <%= file_name_camel %>Controller < ApplicationController
  <%= controller_methods "actions/#{file_name}" %>
end