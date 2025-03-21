<script setup>
import { computed } from 'vue'
import WorkExperienceItem from "./WorkExperienceItem.vue"
import EducationItem from "./EducationItem.vue"
import SkillItem from "./SkillItem.vue"
import ProfileItem from "./ProfileItem.vue"
import ConferenceExperienceItem from "./ConferenceExperienceItem.vue"
import LanguageItem from "@/components/resume/LanguageItem.vue"
import { useDataStore } from "@/stores/dataStore"

const dataStore = useDataStore()
const data = computed(() => dataStore.data)
const profiles = computed(() => dataStore.data.basics?.profiles?.filter(e=>!e.hidden))
const work = computed(() => dataStore.data.work?.filter(e=>!e.hidden))
const conferences = computed(() => dataStore.data.conferences?.filter(e=>!e.hidden))
const education = computed(() => dataStore.data.education?.filter(e=>!e.hidden))
const skills = computed(() => dataStore.data.skills?.filter(e=>!e.hidden))
const certificates = computed(() => dataStore.data.certificates?.filter(e=>!e.hidden))
const awards = computed(() => dataStore.data.awards?.filter(e=>!e.hidden))
const languages = computed(() => dataStore.data.languages?.filter(e=>!e.hidden))
const extras = computed(() => dataStore.data.extras?.filter(e=>!e.hidden))

const profilePic = null // Uncomment below if dynamic import needed
// watchEffect(async () => {
//   profilePic.value = (await import(/* @vite-ignore */ `../assets/images/${data.value.basics.picture}`)).default
// })

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
      <div class="profile">
        <div class="picture" v-if="profilePic">
          <img :src="profilePic" />
        </div>
        <div class="title">
          <p class="name">{{ data.basics.name }}</p>
          <p class="role">{{ data.basics.label }}</p>
        </div>
        <div class="contact">
          <ProfileItem v-for="profile in profiles" :icon="networkIcons[profile.network]" :value="profile.url" />
          <ProfileItem icon="fa fa-envelope" :value="data.basics.email" v-if="data.basics.email" />
          <ProfileItem icon="fa fa-phone" :value="data.basics.phone" v-if="data.basics.phone" />
        </div>
      </div>

      <div class="section" v-if="data.basics.summary" id="summary-section">
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
        <div class="section-content" :class="{ timeline: showTimeline(work) }">
          <WorkExperienceItem v-for="entry in work" :items="entry.highlights" :company="entry.name" :location="entry.location" :role="entry.position" :startDate="entry.startDate" :endDate="entry.endDate" :summary="entry.summary" />
        </div>
      </div>

      <div class="section" v-if="conferences?.length" id="conference-section">
        <div class="section-title">
          <span>{{ $t("section.conference") }}</span>
        </div>
        <div class="section-content" :class="{ timeline: showTimeline(conferences) }">
          <ConferenceExperienceItem v-for="entry in conferences" :items="entry.highlights" :conference="entry.conference" :name="entry.name" :location="entry.location" :summary="entry.summary" :time="entry.time" />
        </div>
      </div>

      <div class="section" v-if="education?.length" id="education-section">
        <div class="section-title">
          <span>{{ $t("section.education") }}</span>
        </div>
        <div class="section-content" :class="{ timeline: showTimeline(education) }">
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
          <SkillItem v-for="entry in awards" :title="entry.title" :value="entry.summary" />
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
