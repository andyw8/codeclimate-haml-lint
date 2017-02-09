require "dry-equalizer"

module CC
  module Engine
    # Generates the remediation points for a given linter
    class RemediationPoints
      include Dry::Equalizer(:points)

      DEFAULT_POINTS = 50_000

      POINTS = {
        "AltText" => DEFAULT_POINTS * 2,
        "ClassAttributeWithStaticValue" => DEFAULT_POINTS,
        "ClassesBeforeIds" => DEFAULT_POINTS,
        "ConsecutiveComments" => DEFAULT_POINTS,
        "ConsecutiveSilentScripts" => DEFAULT_POINTS,
        "EmptyObjectReference" => DEFAULT_POINTS,
        "EmptyScript" => DEFAULT_POINTS,
        "FinalNewline" => DEFAULT_POINTS,
        "HtmlAttributes" => DEFAULT_POINTS * 2,
        "ImplicitDiv" => DEFAULT_POINTS,
        "Indentation" => DEFAULT_POINTS,
        "LeadingCommentSpace" => DEFAULT_POINTS,
        "LineLength" => DEFAULT_POINTS,
        "MultilinePipe" => DEFAULT_POINTS * 2,
        "MultilineScript" => DEFAULT_POINTS,
        "ObjectReferenceAttributes" => DEFAULT_POINTS * 2,
        "RuboCop" => DEFAULT_POINTS * 5,
        "RubyComments" => DEFAULT_POINTS,
        "SpaceBeforeScript" => DEFAULT_POINTS,
        "SpaceInsideHashAttributes" => DEFAULT_POINTS,
        "TagName" => DEFAULT_POINTS,
        "TrailingWhitespace" => DEFAULT_POINTS,
        "UnnecessaryInterpolation" => DEFAULT_POINTS,
        "UnnecessaryStringOutput" => DEFAULT_POINTS,
      }.freeze

      # Instantiates a remediate points value for a linter
      #
      # @api public
      # @param [String] linter the name of the linter to remediate
      def initialize(linter)
        @linter = linter
      end

      # Checks whether there is a points assignment for the linter
      #
      # @api public
      # @return [Boolean]
      def empty?
        !points
      end

      # The number of remediation points for the linter
      #
      # @api public
      # @return [Integer]
      def points
        POINTS[linter]
      end

      # Converts the remediation points into a JSON format
      #
      # @api public
      # @return [String]
      def to_json(*args)
        if points
          points.to_json(*args)
        end
      end

      private

      # The name of the linter to remediate
      #
      # @api private
      # @return [String]
      attr_reader :linter
    end
  end
end
