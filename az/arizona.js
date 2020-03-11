const request = require('request-promise');
const puppeteer = require('puppeteer');
(async () => {
  const browser = await puppeteer.launch({headless: true})
  const page = await browser.newPage()
  
  const navigationPromise = page.waitForNavigation()

  await page.goto('https://tableau.azdhs.gov/views/COVID-19Table/COVID-19table?:isGuestRedirectFromVizportal=y&:embed=y')
  

  await navigationPromise
  
  
  const html = await page.content();
  console.log(html);
  await browser.close()
})()


