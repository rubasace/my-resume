<script setup>
import WorkExperienceItem from "./WorkExperienceItem.vue";
import EducationItem from "./EducationItem.vue";
import SkillItem from "./SkillItem.vue";
import ConferenceExperienceItem from "./ConferenceExperienceItem.vue";
import {FontAwesomeIcon} from '@fortawesome/vue-fontawesome'

defineProps({
      data: {
        type: Object,
        required: true
      }
    }
)
</script>
<script>
export default {
  data() {
    return {
      networkIcons: {
        "GitHub": ['fab', 'github-square'],
        "Linkedin": ['fab', 'linkedin']
      }
    }
  }
}
</script>
<template lang="pug">
.main
  .title
    p.name {{data.basics.name}}
    p.role {{data.basics.label}}
    .contact
      SkillItem(v-for="profile in data.basics.profiles" :icon="this.networkIcons[profile.network]", :value="profile.url")
      //SkillItem(:icon="['fab', 'github-square']", :value="data.contact.github", v-if="data.contact.github" )
      //SkillItem(:icon="['fab', 'linkedin']", :value="data.contact.linkedin", v-if="data.contact.linkedin" )
      SkillItem(icon="envelope", :value="data.basics.email", v-if="data.basics.email" )

  .section(v-if="data.work")
    .section-title
      font-awesome-icon(icon='briefcase').icon
      span Professional Experience
    .section-content.timeline
      WorkExperienceItem(v-for="entry in data.work", :items="entry.highlights", :company="entry.name", :location="entry.location", :role="entry.position", :startDate="entry.startDate", :endDate="entry.endDate")

  .section(v-if="data.conferences")
    .section-title
      font-awesome-icon(icon='plane-departure').icon
      span Conference Presentations
    .section-content.timeline
      ConferenceExperienceItem(v-for="entry in data.conferences", :items="entry.highlights", :conference="entry.conference", :name="entry.name", :location="entry.location", :time="entry.time")

  .section(v-if="data.education")
    .section-title
      font-awesome-icon(icon='graduation-cap').icon
      span Education
    .section-content.timeline
      EducationItem(v-for="entry in data.education", :startDate="entry.startDate", :endDate="entry.endDate", :name="entry.studyType", :school="entry.institution", :description="entry.description")

  .section(v-if="data.skills")
    .section-title
      //font-awesome-icon(icon='brain-circuit').icon
      font-awesome-icon(icon='brain').icon
      span Skills
    .section-content
      SkillItem(v-for="entry in data.skills", :title="entry.name", :value="entry.keywords")

  .section(v-if="data.languages")
    .section-title
      //font-awesome-icon(icon='brain-circuit').icon
      font-awesome-icon(icon='language').icon
      span Languages
    .section-content.flex
      SkillItem(v-for="entry in data.languages", :title="entry.language", :value="entry.fluency")

</template>

<style scoped lang="sass">
$rightTraslation: 0
$highlightColor: darken(#17a095, 0%)
.main
  width: 100%
  height: 100%
  position: relative
  left: $rightTraslation

  .title
    position: relative
    text-transform: uppercase
    font-size: 2.5em
    margin-bottom: 2rem

    .name
      font-weight: bold
      color: $highlightColor

    .role
      font-size: 0.5em
      font-style: italic

    .contact
      position: absolute
      right: 0
      top: 0
      text-align: left
      text-transform: none
      font-size: 1rem

  .section
    width: 100%
    position: relative
    margin-top: 1rem

    .section-title
      font-size: 1.2em

      .icon
        position: absolute
        right: 101%
      //margin-right: 0.3em
      //max-width: 1em
      //max-height: 1em
      span
        text-transform: uppercase
        margin-bottom: 0.5rem
        font-weight: bold
        color: $highlightColor
        border-top: 1px solid
        border-bottom: 1px solid
        display: inline-block
        width: 100%

  .timeline
    position: relative
    margin-right: $rightTraslation
    //left: 0.375in
    &:deep(.item)
      //padding-left: 1rem
      .place
        position: relative
        line-height: 2.3rem

        &::before
          content: " "
          background-color: whitesmoke
          position: absolute
          display: inline-block
          width: 0.3cm
          height: 0.3cm
          border-radius: 1cm
          z-index: 1
          border: 0.065cm solid black
          top: 0.16rem
          left: -1.42rem
          $pointSpace: 0.35rem
          box-shadow: 0 $pointSpace 0px whitesmoke, 0 calc(#{$pointSpace} * -1) 0px whitesmoke

      .title
        .name
          position: relative

    &::after
      content: ""
      background-color: slategray
      position: absolute
      bottom: 0.29rem
      left: -1rem
      top: 0.5rem
      width: 0.06cm
      border-right: 3em

</style>