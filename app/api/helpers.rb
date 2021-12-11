module Helpers
    class Base < Grape::API
      prefix :api
      mount Main::API
      
      def self.respond_to_error(e)
        p e, 'EEEEE'
        logger.error e unless Rails.env.test? # Breaks tests...
        eclass = e.class.to_s
        p eclass
        message = "OAuth error: #{e}" if eclass =~ /WineBouncer::Errors/
        opts = {error: message || e.message}
        opts[:trace] = e.backtrace[0, 10] unless Rails.env.production?
        p opts.to_json
        Rack::Response.new(opts.to_json, self.status_code_for(e, eclass), {
            'Content-Type' => 'application/json',
            'Access-Control-Allow-Origin' => '*',
            'Access-Control-Request-Method' => '*'
        }).finish # el finish hace que el cuerpo del msg sea invalid response
        #e
      end
  
      def self.status_code_for(error, eclass)
        if eclass =~ /OAuthUnauthorizedError/
          401
        elsif eclass =~ /OAuthForbiddenError/
          403
        elsif (eclass =~ /RecordNotFound/) || (error.message =~ /unable to find/i)
          404
        else
          (error.respond_to? :status) && error.status || 500
        end
      end
  
    end
  end