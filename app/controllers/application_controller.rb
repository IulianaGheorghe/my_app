class ApplicationController < ActionController::Base

    def hello
        render html: "hello world!"
    end

    def goodbye
        render html: "goodbye world!"
    end

    def extra 
        render json: {
            "message": "hello world!",
            "error": "goodbye world!"
        }
    end

    def bye 
        respond_to do |format|
            format.html {
              render :html => "hello there!"
            }
            format.json {
              render :json => {"message": "hello there!", "error": "bye!"}
            }
        end
    end

end
