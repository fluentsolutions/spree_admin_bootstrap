module SpreeAdminBootstrap
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def add_javascripts
        append_file 'vendor/assets/javascripts/spree/backend/all.js', "//= require admin/spree_admin_bootstrap\n"
      end

      def add_stylesheets
        # remove_file 'vendor/assets/stylesheets/spree/backend/all.css'
        append_file 'vendor/assets/stylesheets/spree/backend/all.css', "*= require admin/spree_admin_bootstrap"
        # create_file 'app/assets/stylesheets/admin/all.css' do
        #   "/*
        #   * This is a manifest file that'll automatically include all the stylesheets available in this directory
        #   * and any sub-directories. You're free to add application-wide styles to this file and they'll appear at
        #   * the top of the compiled file, but it's generally better to create a new file per style scope.
        #   *
        #   *= require admin/spree_admin_bootstrap
        #   */
        #   "
        # end
      end
    end
  end
end
