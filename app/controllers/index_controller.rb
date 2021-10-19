class IndexController < ApplicationController
    def index
        render json: { plop: "plop"}
    end
end
