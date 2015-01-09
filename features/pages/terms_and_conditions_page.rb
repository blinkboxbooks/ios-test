module PageObjectModel
  class TermsAndConditionsPage < PageObjectModel::Page
    trait "UINavigationBar marked:'Terms & Conditions'"
    element :blinkbox_books_heading, "webView css:'H1' textContent:'blinkbox books'"
    element :tandc_heading, "webView css:'H1' textContent:'Terms and conditions'"
  end
end

module PageObjectModel
  def terms_and_conditions_page
    @_terms_and_conditions_page ||= page(TermsAndConditionsPage)
  end
end