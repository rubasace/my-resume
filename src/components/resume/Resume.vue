<script setup>
import { computed } from 'vue'
import WorkExperienceItem from "./WorkExperienceItem.vue"
import EducationItem from "./EducationItem.vue"
import SkillItem from "./SkillItem.vue"
import ProfileItem from "./ProfileItem.vue"
import ConferenceItem from "./ConferenceItem.vue"
import LanguageItem from "@/components/resume/LanguageItem.vue"
import { useDataStore } from "@/stores/dataStore"
import {useStyleStore} from "@/stores/styleStore";
import AwardItem from "@/components/resume/AwardItem.vue";
import InterestItem from "@/components/resume/InterestItem.vue";
import ProjectItem from "@/components/resume/ProjectItem.vue";
import PublicationItem from "@/components/resume/PublicationItem.vue";

const dataStore = useDataStore()
let styleStore = useStyleStore();
const data = computed(() => dataStore.data)


const profiles = visibleEntries(() => dataStore.data.basics?.profiles, 'Profiles')
const work = visibleEntries(() => dataStore.data.work, 'Experience')
const projects = visibleEntries(() => dataStore.data.projects, 'Projects')
const publications = visibleEntries(() => dataStore.data.publications, 'Publications')
const conferences = visibleEntries(() => dataStore.data.conferences, 'Conferences')
const education = visibleEntries(() => dataStore.data.education, 'Education')
const skills = visibleEntries(() => dataStore.data.skills, 'Skills')
const certificates = visibleEntries(() => dataStore.data.certificates, 'Certificates')
const awards = visibleEntries(() => dataStore.data.awards, 'Awards')
const languages = visibleEntries(() => dataStore.data.languages, 'Languages')
const interests = visibleEntries(() => dataStore.data.interests, 'Interests')
const extras = visibleEntries(() => dataStore.data.extras, 'Extras')

function visibleEntries(getter, section) {
  return computed(() => styleStore.style.hiddenSections?.includes(section) ? [] : getter()?.filter(e => !e.hidden))
}

const profilePic = computed(() => {
  if(styleStore.style.hiddenSections?.includes('Picture')) {
    return null
  }
  if(data.value.basics.picture?.startsWith("http")) {
    return data.value.basics.picture
  }
  return null;
})

const networkIcons = {
  GitHub: "fa-brands fa-github",
  Linkedin: "fa-brands fa-linkedin",
  Twitter: "fa-brands fa-twitter",
  Instagram: "fa-brands fa-instagram",
}

function showTimeline(items) {
  return Array.isArray(items) && items.length >= 1
}
</script>

<template>
  <div class="page">
    <div class="resume">
      <div class="section" id="profile-section">
        <div class="picture" v-if="profilePic">
          <img :src="profilePic" />
        </div>
        <div class="title">
          <p class="name">{{ data.basics.name }}</p>
          <p class="role">{{ data.basics.label }}</p>
        </div>
      </div>
      <div class="section" id="contact-section">
        <ProfileItem v-for="profile in profiles" :icon="networkIcons[profile.network]" :url="profile.url" :text="profile.text" :network="profile.network" />
        <ProfileItem icon="fa fa-envelope" :url="data.basics.email" v-if="data.basics.email" network="Email" />
        <ProfileItem icon="fa fa-phone" :url="data.basics.phone" v-if="data.basics.phone" network="Phone"/>
      </div>

      <div class="section" v-if="data.basics.summary && !styleStore.style.hiddenSections?.includes('About')" id="summary-section">
        <div class="section-title">
          <span>{{ $t("section.about") }}</span>
        </div>
        <div class="section-content">
          <p>{{ data.basics.summary }}</p>
        </div>
      </div>

      <div class="section" v-if="work?.length" id="work-section">
        <div class="section-title">
          <span>{{ $t("section.experience") }}</span>
        </div>
        <div class="section-content"  :class="{ timeline: showTimeline(work) }">
          <WorkExperienceItem v-for="entry in work" :items="entry.highlights" :company="entry.name" :location="entry.location" :role="entry.position" :startDate="entry.startDate" :endDate="entry.endDate" :summary="entry.summary" />
        </div>
      </div>

      <div class="section" v-if="projects?.length" id="projects-section">
        <div class="section-title">
          <span>{{ $t("section.projects") }}</span>
        </div>
        <div class="section-content" >
          <ProjectItem v-for="entry in projects" :highlights="entry.highlights" :name="entry.name" :startDate="entry.startDate" :endDate="entry.endDate" :description="entry.description" />
        </div>
      </div>

      <div class="section" v-if="publications?.length" id="publications-section">
        <div class="section-title">
          <span>{{ $t("section.publications") }}</span>
        </div>
        <div class="section-content" >
          <PublicationItem v-for="entry in publications" :name="entry.name" :publisher="entry.publisher" :releaseDate="entry.releaseDate" :summary="entry.summary" />
        </div>
      </div>

      <div class="section" v-if="conferences?.length" id="conference-section">
        <div class="section-title">
          <span>{{ $t("section.conference") }}</span>
        </div>
        <div class="section-content" >
          <ConferenceItem v-for="entry in conferences" :items="entry.highlights" :conference="entry.conference" :name="entry.name" :location="entry.location" :summary="entry.summary" :time="entry.time" />
        </div>
      </div>

      <div class="section" v-if="education?.length" id="education-section">
        <div class="section-title">
          <span>{{ $t("section.education") }}</span>
        </div>
        <div class="section-content" >
          <EducationItem v-for="entry in education" :startDate="entry.startDate" :endDate="entry.endDate" :name="entry.studyType" :school="entry.institution" :description="entry.description" />
        </div>
      </div>

      <div class="section" v-if="certificates?.length" id="certificates-section">
        <div class="section-title">
          <span>{{ $t("section.certificates") }}</span>
        </div>
        <div class="section-content">
          <EducationItem v-for="entry in certificates" :startDate="entry.date" :name="entry.issuer" :school="entry.name" />
        </div>
      </div>

      <div class="section" v-if="skills?.length" id="skills-section">
        <div class="section-title">
          <span>{{ $t("section.skills") }}</span>
        </div>
        <div class="section-content">
          <SkillItem v-for="entry in skills" :title="entry.name" :value="entry.keywords" />
        </div>
      </div>

      <div class="section" v-if="awards?.length" id="awards-section">
        <div class="section-title">
          <span>{{ $t("section.awards") }}</span>
        </div>
        <div class="section-content">
          <AwardItem :title="entry.title" :awarder="entry.awarder" :date="entry.date" :summary="entry.summary" v-for="entry in awards" />
        </div>
      </div>

      <div class="section" v-if="languages?.length" id="languages-section">
        <div class="section-title">
          <span>{{ $t("section.languages") }}</span>
        </div>
        <div class="section-content flex">
          <LanguageItem v-for="entry in languages" :name="entry.language" :level="entry.fluency" />
        </div>
      </div>

      <div class="section" v-if="interests?.length" id="interests-section">
        <div class="section-title">
          <span>{{ $t("section.interests") }}</span>
        </div>
        <div class="section-content flex">
          <InterestItem v-for="entry in interests" :name="entry.name" :keywords="entry.keywords" />
        </div>
      </div>

      <div class="section" v-if="extras?.length" id="extras-section">
        <div class="section-title">
          <span>{{ $t("section.extras") }}</span>
        </div>
        <div class="section-content flex">
          <SkillItem :value="extras" />
        </div>
      </div>
    </div>
  </div>
</template>
