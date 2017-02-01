#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'
require 'mechanize'
require 'phantom_mechanize'

require 'selenium-webdriver'
require 'phantomjs'
require 'watir'

module Journyx
  class Scrapper
    JOURNYX_URL = "https://growthaccel.apps.journyx.com/jtcgi/wte.pyc"
    attr_reader :username, :password, :project, :page, :category
    def initialize(params = {})
      @username = params.fetch(:username)
      @username = params.fetch(:password)
      @username = params.fetch(:project)
      @username = params.fetch(:category)
    end

    def post_data
      browser = Watir::Browser.new :phantomjs
      browser.window.maximize
      browser.goto "https://growthaccel.apps.journyx.com/jtcgi/wte.pyc?TE=1&"

      #Login
      browser.text_field(name: "wtusername").set(username)
      browser.text_field(name: "wtpassword").set(password)

      browser.form(name: "a").submit

      left_table = browser.tbody(id: "idMainTableLeftbody")
      description_row = left_table.tr(class: "rowtype_New").tds.last
      description_row.text_fields.first.set("Hola 2")

      project_row = left_table.tr(class: "rowtype_New").tds.first

      project_row.select_lists.first.options.each do |option|
        if option.text.downcase.strip == project.downcase.strip
          option.click
        end
      end
      sleep 3
      category_row = left_table.tr(class: "rowtype_New").tds[1]
      category_row.select_lists.first.options.each do |option|
        if option.text.downcase.strip == category.downcase.strip
          option.click
        end
      end

      right_table = browser.tbody(id: "idMainTableRightbody")
      hour_row = right_table.tr(class: "rowtype_New").tds[2]
      hour_row.text_fields.first.set("9:30")

      save_button = browser.input(id: "enterAction")

      save_button.click

      browser.close
    end
  end
end
