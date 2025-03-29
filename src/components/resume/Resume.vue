<script setup>
import {computed} from 'vue'
import WorkExperienceItem from "./WorkExperienceItem.vue"
import EducationItem from "./EducationItem.vue"
import SkillItem from "./SkillItem.vue"
import ProfileItem from "./ProfileItem.vue"
import ConferenceItem from "./ConferenceItem.vue"
import LanguageItem from "@/components/resume/LanguageItem.vue"
import {useDataStore} from "@/stores/dataStore"
import {useStyleStore} from "@/stores/styleStore";
import AwardItem from "@/components/resume/AwardItem.vue";
import InterestItem from "@/components/resume/InterestItem.vue";
import ProjectItem from "@/components/resume/ProjectItem.vue";
import PublicationItem from "@/components/resume/PublicationItem.vue";
import CertificateItem from "@/components/resume/CertificateItem.vue";

const dataStore = useDataStore()
let styleStore = useStyleStore();
const data = computed(() => dataStore.data)

const profiles = visibleEntries(() => dataStore.data.basics?.profiles, 'Profiles')

function visibleEntries(getter, section) {
  return computed(() => styleStore.style.hiddenSections?.includes(section) ? [] : getter()?.filter(e => !e.hidden))
}

const profilePic = computed(() => {
  if (styleStore.style.hiddenSections?.includes('picture')) {
    return null
  }
  if (data.value.basics.picture?.startsWith("http")) {
    return data.value.basics.picture
  }
  return null;
})

function showTimeline(section) {
  if (!styleStore.style.showTimeline || 'work' !== section) {
    return false
  }
  return Array.isArray(data.value[section]) && data.value[section].length >= 1
}
</script>

<template>
  <div class="resume">
    <div class="page" :class="styleStore.style.showIcons ? 'show-icons' : ''">
      <div class="page-content">
        <div class="section" id="profile-section">
          <div class="picture" v-if="profilePic">
            <img :src="profilePic" alt="Profile picture"/>
          </div>
          <div class="title">
            <p class="name">{{ data.basics.name }}</p>
            <p class="role">{{ data.basics.label }}</p>
          </div>
        </div>
        <div class="section" id="contact-section">
          <ProfileItem v-for="profile in profiles" :icon="profile.icon" :url="profile.url" :text="profile.text" :network="profile.network"/>
          <ProfileItem icon="fa fa-envelope" :text="data.basics.email" :url="data.basics.email" v-if="data.basics.email" network="Email"/>
          <ProfileItem icon="fa fa-phone" :text="data.basics.phone" v-if="data.basics.phone" network="Phone"/>
          <ProfileItem icon="fa fa-location-dot" :text="data.basics.location.summary" v-if="data.basics.location.summary" network="Location"/>
        </div>

        <div class="section" v-if="data.basics.summary && !styleStore.style.hiddenSections?.includes('about')" id="summary-section">
          <div class="section-title">
            <span>{{ $t("section.about") }}</span>
          </div>
          <div class="section-content">
            <p>{{ data.basics.summary }}</p>
          </div>
        </div>

        <div class="section" v-for="section in styleStore.visibleSections" :id="section + '-section'">
          <div class="section-title">
            <span>{{ $t("section." + section) }}</span>
          </div>
          <div class="section-content" :class="{ timeline: showTimeline(section) }">
            <div v-for="entry in data[section]?.filter(e => !e.hidden)">
              <WorkExperienceItem v-if="'work'===section" :items="entry.highlights" :company="entry.name" :location="entry.location" :role="entry.position"
                                  :startDate="entry.startDate"
                                  :endDate="entry.endDate" :url="entry.url" :summary="entry.summary"/>
              <ProjectItem v-else-if="'projects'===section" :highlights="entry.highlights" :name="entry.name" :url="entry.url" :startDate="entry.startDate" :endDate="entry.endDate"
                           :description="entry.description"/>
              <PublicationItem v-else-if="'publications'===section" :name="entry.name" :url="entry.url" :publisher="entry.publisher" :releaseDate="entry.releaseDate"
                               :summary="entry.summary"/>
              <ConferenceItem v-else-if="'conferences'===section" :items="entry.highlights" :conference="entry.conference" :title="entry.title" :location="entry.location"
                              :url="entry.url"
                              :summary="entry.summary" :time="entry.time"/>
              <EducationItem v-else-if="'education'===section" :startDate="entry.startDate" :endDate="entry.endDate" :name="entry.studyType" :school="entry.institution"
                             :url="entry.url"
                             :description="entry.description"/>
              <CertificateItem v-else-if="'certificates'===section" :date="entry.date" :issuer="entry.issuer" :name="entry.name" :url="entry.url"/>
              <SkillItem v-else-if="'skills'===section" :title="entry.name" :value="entry.keywords"/>
              <AwardItem v-else-if="'awards'===section" :title="entry.title" :awarder="entry.awarder" :date="entry.date" :url="entry.url" :summary="entry.summary"/>
              <InterestItem v-else-if="'interests'===section" :name="entry.name" :keywords="entry.keywords"/>
              <LanguageItem v-else-if="'languages'===section" :name="entry.language" :level="entry.fluency"/>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
