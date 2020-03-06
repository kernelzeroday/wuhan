const puppeteer = require('puppeteer');
(async () => {
  const browser = await puppeteer.launch()
  const page = await browser.newPage()
  
  const navigationPromise = page.waitForNavigation()
  
  await page.goto('https://www.nytimes.com/interactive/2020/us/coronavirus-us-cases.html')
  
  await page.setViewport({ width: 1440, height: 798 })
  
  await navigationPromise
  
  await page.waitForSelector('.css-17ih8de > .g-story > .g-asset:nth-child(14) > .g-svelte > .svelte-b8g3a7:nth-child(2)')
  await page.click('.css-17ih8de > .g-story > .g-asset:nth-child(14) > .g-svelte > .svelte-b8g3a7:nth-child(2)')

 
  const html = await page.content();
  console.log(html);
  await browser.close()
})()
