After do
    temp = page.save_screenshot("logs/temp_screenshot.png")

    Allure.add_attachment(
      name: "Screenshot",
      type: Allure::ContentType::PNG,
      source: File.open(temp)   
    )
end
