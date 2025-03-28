const profiles = {
    GitHub: "fa-brands fa-github",
    Gitlab: "fa-brands fa-gitlab",
    LinkedIn: "fa-brands fa-linkedin",
    Twitter: "fa-brands fa-twitter",
    Threads: "fa-brands fa-threads",
    Instagram: "fa-brands fa-instagram",
    Facebook: "fa-brands fa-facebook",
    YouTube: "fa-brands fa-youtube",
    Figma: "fa-brands fa-figma",
    Medium: "fa-brands fa-medium",
    Kickstarter: "fa-brands fa-kickstarter",
}

export function getProfileNames() {
    return Object.keys(profiles);
}

export function getProfileIcon(name) {
    console.log(profiles)
    console.log(name)
    return profiles[name];
}