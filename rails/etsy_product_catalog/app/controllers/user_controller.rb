class UserController < ApplicationController


=begin  to put in view
<% if user_signed_in? %>
          # do something
     <% else %>
       <%= link_to "Log in", new_user_session_path, class: "btn btn-default btn-sm" %> &nbsp;
       <%= link_to "Sign up", new_user_registration_path, class: "btn btn-primary btn-sm" %> &nbsp;
    </p>
  <% end %>

To finish in controller (maybe an Etsy controller)

    def self.myself(token, secret, options = {})
      find('__SELF__', {:access_token => Etsy.api_key => user.token,, :access_secret => secret}.merge(options))
    end

    # The shop associated with this user.
    #
    def shop
      @shop ||= shops.first
    end

    # The addresses associated with this user.
    #
    def addresses
      options = (token && secret) ? {:access_token => token, :access_secret => secret} : {}
      @addresses ||= Address.find(username, options)
    end
=end
end
