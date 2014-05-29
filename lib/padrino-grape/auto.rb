require 'padrino-grape/extend'
require 'padrino'
require 'grape'

Grape::API.__send__ :extend, ::PadrinoGrape::Extend

# base.__send__ :setup_application!