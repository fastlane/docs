module Fastlane
  module Actions
    class TestSampleCodeAction < Action
      def self.run(params)
        content = File.read(params[:path])
        ENV["CI"] = 1.to_s

        # /m says we ignore new line
        errors = []
        content.scan(/```ruby\n([^`]*)\n```/m).each do |current_match|
          current_match = current_match.first # we only expect one match

          UI.message("parsing: #{current_match}")

          begin
            begin
              eval(current_match)
            rescue SyntaxError => ex
              UI.user_error!("Syntax error in code sample: #{current_match}")
            rescue => ex
              UI.error("Error found in code sample: #{current_match}")
              raise ex
            end
          rescue => ex
            errors << ex
          end
        end

        errors.each do |ex|
          UI.error(ex)
        end

        ENV.delete("CI")
        UI.user_error!("Found at #{errors.count} errors in the documentation") unless errors.empty?
      end

      # Is used to look if the method is implemented as an action
      def self.method_missing(method_sym, *arguments, &_block)
        return if blacklist.include?(method_sym)

        class_ref = self.runner.class_reference_from_action_name(method_sym)
        UI.user_error!("Could not find method or action named '#{method_sym}'") if class_ref.nil?
        available_options = class_ref.available_options

        if available_options.kind_of?(Array) && available_options.first && available_options.first.kind_of?(FastlaneCore::ConfigItem)
          parameters = arguments.shift || []
          parameters.each do |current_argument, value|
            UI.message("Verifying '#{value}' for option '#{current_argument}' for action '#{method_sym}'")

            config_item = available_options.find { |a| a.key == current_argument }
            UI.user_error!("Unknown parameter '#{current_argument}' for action '#{method_sym}'") if config_item.nil?

            if config_item.data_type && !value.kind_of?(config_item.data_type)
              UI.user_error!("'#{current_argument}' value must be a #{config_item.data_type}! Found #{value.class} instead.")
            end
          end
        else
          UI.verbose("Legacy parameter technique for action '#{method_sym}'")
        end
      end

      # If the action name is x, don't run the verification
      # This will still verify the syntax though
      # The actions listed here are still legacy actions, so 
      # they don't use the fastlane configuration system
      def self.blacklist
        [
          :import,
          :xcode_select,
          :frameit
        ]
      end

      # Metadata
      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :path)
        ]
      end

      def self.authors
        ["KrauseFx"]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
