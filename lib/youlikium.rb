require 'selenium-webdriver'

class Youlikium

	def initialize
		profile = Selenium::WebDriver::Firefox::Profile.new
		# disable loading images
		profile['permissions.default.image'] = 2
		@driver = Selenium::WebDriver.for :firefox, profile: profile
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
		raise ArgumentError.new "Could not extract video if from '#{line}'"
	end

	def open_video(id)
		@driver.navigate.to "https://www.youtube.com/watch?v=#{id}"
	end

	def like_current
		@driver.find_element(css: 'ytd-video-primary-info-renderer #top-level-buttons button#button').click
	end

end
