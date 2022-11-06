<script setup>
import {ref, watchEffect} from 'vue'
import WorkExperienceItem from "./WorkExperienceItem.vue";
import EducationItem from "./EducationItem.vue";
import SkillItem from "./SkillItem.vue";
import ConferenceExperienceItem from "./ConferenceExperienceItem.vue";
import {FontAwesomeIcon} from '@fortawesome/vue-fontawesome'

const props = defineProps({
      data: {
        type: Object,
        required: true
      }
    }
)
const profilePic = ref()
watchEffect(async () => {
  profilePic.value = (await import(/* @vite-ignore */ `../assets/images/${props.data.basics.picture}`)).default
})
</script>
<script>
export default {
  data() {
    return {
      networkIcons: {
        GitHub: ["fab", "github-square"],
        Linkedin: ["fab", "linkedin"],
      },
      // profilePic: this.data.basics.picture ? new URL(`/src/assets/images/photo-placeholder.png`, import.meta.url) : undefined
    }
  },
  methods: {
    showTimeline(items) {
      return Array.isArray(items) & items.length > 1;
    }
  }
}
</script>
<template lang="pug">
.main
  .profile
    .picture(v-if='profilePic')
      img(:src='profilePic')
    .title
      p.name {{data.basics.name}}
      p.role {{data.basics.label}}
    .contact
      SkillItem(v-for="profile in data.basics.profiles" :icon="networkIcons[profile.network]", :value="profile.url")
      SkillItem(icon="envelope", :value="data.basics.email", v-if="data.basics.email" )
      SkillItem(icon="phone", :value="data.basics.phone", v-if="data.basics.phone" )

  .section(v-if="data.basics.summary")
    .section-title
      font-awesome-icon(icon='user').icon
      span {{ $t("section.about") }}
    .section-content
      p {{data.basics.summary}}

  .section(v-if="data.work")
    .section-title
      font-awesome-icon(icon='briefcase').icon
      span {{ $t("section.experience") }}
    .section-content(:class="{'timeline' : showTimeline(data.work)}")
      WorkExperienceItem(v-for="entry in data.work", :items="entry.highlights", :company="entry.name", :location="entry.location", :role="entry.position", :startDate="entry.startDate", :endDate="entry.endDate", :summary="entry.summary")

  .section(v-if="data.conferences")
    .section-title
      font-awesome-icon(icon='plane-departure').icon
      span {{ $t("section.conference") }}
    .section-content(:class="{'timeline' : showTimeline(data.conferences)}")
      ConferenceExperienceItem(v-for="entry in data.conferences", :items="entry.highlights", :conference="entry.conference", :name="entry.name", :location="entry.location", :summary="entry.summary", :time="entry.time")

  .section(v-if="data.education")
    .section-title
      font-awesome-icon(icon='graduation-cap').icon
      span {{ $t("section.education") }}
    .section-content(:class="{'timeline' : showTimeline(data.education)}")
      EducationItem(v-for="entry in data.education", :startDate="entry.startDate", :endDate="entry.endDate", :name="entry.studyType", :school="entry.institution", :description="entry.description")

  .section(v-if="data.certificates")
    .section-title
      font-awesome-icon(icon='award').icon
      span {{ $t("section.certificates") }}
    .section-content
      EducationItem(v-for="entry in data.certificates", :startDate="entry.date", :name="entry.issuer", :school="entry.name")

  .section(v-if="data.skills")
    .section-title
      font-awesome-icon(icon='brain').icon
      span {{ $t("section.skills") }}
    .section-content
      SkillItem(v-for="entry in data.skills", :title="entry.name", :value="entry.keywords")

  .section(v-if="data.awards")
    .section-title
      font-awesome-icon(icon='trophy').icon
      span {{ $t("section.awards") }}
    .section-content
      SkillItem(v-for="entry in data.awards", :title="entry.title", :value="entry.summary")

  .section(v-if="data.languages")
    .section-title
      font-awesome-icon(icon='language').icon
      span {{ $t("section.languages") }}
    .section-content.flex
      SkillItem(v-for="entry in data.languages", :title="entry.language", :value="entry.fluency")

  .section(v-if="data.extras")
    .section-title
      font-awesome-icon(icon='square-plus').icon
      span {{ $t("section.extras") }}
    .section-content.flex
      SkillItem(:value="data.extras")

</template>
