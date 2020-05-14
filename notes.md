Name of brand:    results = doc.css("div.article__block .layout-block h2.layout-block__heading").first.text

description:       results = doc.css("div.article__block .layout-block div.layout-block__main div.layout-block__content.rich-text").first.text
 <!--includes "See the rating.
Shop PACT."-->

rating:          results = doc.css("div.article__block .layout-block div.layout-block__aside div.meta-labels").first.text

shipping info:   results = doc.css("div.article__block .layout-block div.layout-block__main div.layout-block__content figure.layout-block__image-container").first.text
<!--needs formatting -->

link:    results = doc.css("div.article__block .layout-block h2.layout-block__heading a").attribute("href")






