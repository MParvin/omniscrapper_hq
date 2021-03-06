module Domain
  module Configuration
    # Builds a list of required fields from scrapper metadata
    class Crawler
      class CrawlerDoesNotExist < StandardError; end;

      include Import[
        'omniscrapper.crawlers'
      ]

      def required_fields(crawler_name)
        crawler_class(crawler_name).required_attributes
      end

      private

      def crawler_class(crawler_name)
        crawlers.by_name(crawler_name) || raise(CrawlerDoesNotExist, crawler_name)
      end
    end
  end
end
