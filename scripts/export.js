const puppeteer = require('puppeteer');

(async () => {
    const browser = await puppeteer.launch({
        headless: true,
        args: ['--no-sandbox',
            '--disable-setuid-sandbox',
            '--disable-gpu',
            '--hide-scrollbars',
            '--disable-web-security']
    });
    const page = await browser.newPage();
    await page.goto('http://localhost:3000', {
        waitUntil: 'networkidle2',
    });
    await page.pdf({
        path: 'resume.pdf',
        format: 'A4',
        printBackground: true
    });

    await browser.close();
})();