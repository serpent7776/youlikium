require 'selenium-webdriver'
require 'selenium/webdriver/common'

class Youlikium

	def initialize
		profile = Selenium::WebDriver::Firefox::Profile.new
		# disable loading images
		profile['permissions.default.image'] = 2
		@driver = Selenium::WebDriver::Firefox::Driver.new profile: profile
		@driver.navigate.to 'https://youtube.com'
	end

	def is_logged_in
		begin
			@driver.find_element(id: 'avatar-btn')
			return true
		rescue Selenium::WebDriver::Error::NoSuchElementError
			return false
		end
	end

	def get_id(line)
		# try matching youtube-dl file name
		m = %r{-([-_0-9a-zA-Z]{11})\.\w+}.match line
		if m then
			return m[1]
		end
		# try matching url
		m = %r{\byoutube\.com/watch\?v=([-_0-9a-zA-Z]{11}\b)}.match line
		if m then
			return m[1]
		end
		raise ArgumentError.new "Could not extract video id from '#{line}'"
	end

	def open_video(id)
		@driver.navigate.to "https://www.youtube.com/watch?v=#{id}"
	end

	def like_current
		@driver.find_elements(css: 'ytd-menu-renderer.ytd-watch-metadata > div:nth-child(1) > ytd-segmented-like-dislike-button-renderer:nth-child(1) > div:nth-child(1) > ytd-toggle-button-renderer:nth-child(1) > yt-button-shape:nth-child(1) > button:nth-child(1) > yt-touch-feedback-shape:nth-child(3) > div:nth-child(1)').last.click
	end

end
# vim: set sw=8 ts=8 noet:
