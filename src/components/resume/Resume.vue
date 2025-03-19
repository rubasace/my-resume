<script setup>
import { computed } from 'vue';
import WorkExperienceItem from "./WorkExperienceItem.vue";
import EducationItem from "./EducationItem.vue";
import SkillItem from "./SkillItem.vue";
import ProfileItem from "./ProfileItem.vue";
import ConferenceExperienceItem from "./ConferenceExperienceItem.vue";
import { useDataStore } from "@/stores/dataStore";

const dataStore = useDataStore();
const data = computed(() => dataStore.data);

// const profilePic = ref()
// watchEffect(async () => {
//   profilePic.value = (await import(/* @vite-ignore */ `../assets/images/${data.value.basics.picture}`)).default
// })
</script>
<script>
export default {
  data() {
    return {
      networkIcons: {
        GitHub: "fa-brands fa-square-github",
        Linkedin: "fa-brands fa-linkedin",
      },
      // profilePic: this.data.basics.picture ? new URL(`/src/assets/images/photo-placeholder.png`, import.meta.url) : undefined
    };
  },
  methods: {
    showTimeline(items) {
      return Array.isArray(items) & items.length >= 1;
    }
  }
};
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
          <ProfileItem v-for="profile in data.basics.profiles" :icon="networkIcons[profile.network]" :value="profile.url" />
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

      <div class="section" v-if="data.work" id="work-section">
        <div class="section-title">
          <span>{{ $t("section.experience") }}</span>
        </div>
        <div class="section-content" :class="{ timeline: showTimeline(data.work) }">
          <WorkExperienceItem v-for="entry in data.work" :items="entry.highlights" :company="entry.name" :location="entry.location" :role="entry.position" :startDate="entry.startDate" :endDate="entry.endDate" :summary="entry.summary" />
        </div>
      </div>

      <div class="section" v-if="data.conferences" id="conference-section">
        <div class="section-title">
          <span>{{ $t("section.conference") }}</span>
        </div>
        <div class="section-content" :class="{ timeline: showTimeline(data.conferences) }">
          <ConferenceExperienceItem v-for="entry in data.conferences" :items="entry.highlights" :conference="entry.conference" :name="entry.name" :location="entry.location" :summary="entry.summary" :time="entry.time" />
        </div>
      </div>

      <div class="section" v-if="data.education" id="education-section">
        <div class="section-title">
          <span>{{ $t("section.education") }}</span>
        </div>
        <div class="section-content" :class="{ timeline: showTimeline(data.education) }">
          <EducationItem v-for="entry in data.education" :startDate="entry.startDate" :endDate="entry.endDate" :name="entry.studyType" :school="entry.institution" :description="entry.description" />
        </div>
      </div>

      <div class="section" v-if="data.certificates" id="certificates-section">
        <div class="section-title">
          <span>{{ $t("section.certificates") }}</span>
        </div>
        <div class="section-content">
          <EducationItem v-for="entry in data.certificates" :startDate="entry.date" :name="entry.issuer" :school="entry.name" />
        </div>
      </div>

      <div class="section" v-if="data.skills" id="skills-section">
        <div class="section-title">
          <span>{{ $t("section.skills") }}</span>
        </div>
        <div class="section-content">
          <SkillItem v-for="entry in data.skills" :title="entry.name" :value="entry.keywords" />
        </div>
      </div>

      <div class="section" v-if="data.awards" id="awards-section">
        <div class="section-title">
          <span>{{ $t("section.awards") }}</span>
        </div>
        <div class="section-content">
          <SkillItem v-for="entry in data.awards" :title="entry.title" :value="entry.summary" />
        </div>
      </div>

      <div class="section" v-if="data.languages" id="languages-section">
        <div class="section-title">
          <span>{{ $t("section.languages") }}</span>
        </div>
        <div class="section-content flex">
          <SkillItem v-for="entry in data.languages" :title="entry.language" :value="entry.fluency" />
        </div>
      </div>

      <div class="section" v-if="data.extras" id="extras-section">
        <div class="section-title">
          <span>{{ $t("section.extras") }}</span>
        </div>
        <div class="section-content flex">
          <SkillItem :value="data.extras" />
        </div>
      </div>
    </div>
  </div>
</template>
