class ApplicationController < ActionController::Base
    include UsersHelper
    include HouseCoinsHelper
    include ChargesHelper
    include ChatroomHelper
end