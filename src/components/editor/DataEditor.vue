<script setup>
import {useDataStore} from "@/stores/dataStore";
import {InputChips, Textarea} from "primevue";
import TextInput from "@/components/editor/TextInput.vue";
import InputItem from "@/components/editor/InputItem.vue";
import {VueDraggable} from "vue-draggable-plus";
import Section from "@/components/editor/Section.vue";


const dataStore = useDataStore();

const addProfile = () => {
  dataStore.data.basics.profiles.push({network: '', url: '', placeholder: ''});
};


const addExperience = () => {
  dataStore.data.work.push({
    name: "",
    position: "",
    location: "",
    startDate: "",
    endDate: "",
    summary: "",
    highlights: [""]
  });
};

const addConference = () => {
  dataStore.data.conferences.push({
    conference: "",
    name: "",
    location: "",
    time: "",
    summary: ""
  });
};

const addEducation = () => {
  dataStore.data.education.push({
    institution: "",
    studyType: "",
    startDate: "",
    endDate: "",
    summary: ""
  });
};

const addSkill = () => {
  dataStore.data.skills.push({
    name: "",
    keywords: [],
  });
};

const addLanguage = () => {
  dataStore.data.languages.push({
    language: "",
    fluency: "",
  });
};


const addHighlight = (work) => {
  if (!work.highlights) {
    work.highlights = [];
  }
  work.highlights.push("");
};

const removeElement = (array, index) => {
  array.splice(index, 1);
};

</script>

<template>

  <!--  TODO allow to show margins-->
  <!--  TODO improve dragging of visor -->
  <!--  TODO Add alert on overflow and/or allow multi-page-->
  <!--  TODO add filepicker for picture-->
  <!--  TODO add confirmation for deletions -->
  <!--  TODO add autocomplete for known networks on profiles-->
  <!--  TODO allow to add experience from the top-->
  <!--  TODO think of adding other themes-->
  <!--  TODO add support for text on profiles and allow to indicate icon-->
  <!--  TODO allow to modify order of sections at will-->
  <!--  TODO add translations-->
  <!--  TODO Revisit sizes of the entire resume as margins don't look the same on all resolutions -->
  <!--  TODO allow to configure font-->
  <!--  TODO add validations?-->
  <!--  TODO Add support for all sections on John Doe resume-->

  <Section legend="Basic Data" icon="fas fa-address-card" :hideable="false">
    <div class="grid-2">
      <TextInput v-model="dataStore.data.basics.name" label="Name"/>
      <TextInput v-model="dataStore.data.basics.label" label="Label"/>
      <TextInput v-model="dataStore.data.basics.picture" label="Picture"/>
      <TextInput v-model="dataStore.data.basics.email" label="Email"/>
    </div>
    <Textarea auto-resize id="summary" v-model="dataStore.data.basics.summary" placeholder="Information about yourself (optional)" style="width:100%" class="mb-2 mt-2"/>
  </Section>
  <Section legend="Profiles" icon="fas fa-link" v-model="dataStore.data.basics.profiles">
    <VueDraggable v-model="dataStore.data.basics.profiles" handle=".handle">
      <InputItem v-for="(profile, index) in dataStore.data.basics.profiles"
                 :key="index"
                 v-model="dataStore.data.basics.profiles[index]"
                 @delete="removeElement(dataStore.data.basics.profiles, index)">
        <div class="grid-3">
          <TextInput v-model="profile.network" label="Network"/>
          <TextInput v-model="profile.url" label="URL"/>
          <TextInput v-model="profile.text" label="Text"/>
        </div>
      </InputItem>
    </VueDraggable>
    <button @click="addProfile" class="button-add">
      <i class="fas fa-plus"></i> Add Profile
    </button>
  </Section>
  <Section legend="Experience" icon="fas fa-briefcase">
    <VueDraggable v-model="dataStore.data.work" handle=".handle">
      <InputItem v-for="(work, index) in dataStore.data.work"
                 :key="index"
                 v-model="dataStore.data.work[index]"
                 @delete="removeElement(dataStore.data.work,index)">
        <div class="grid-3">
          <TextInput v-model="work.name" label="Company"/>
          <TextInput v-model="work.position" label="Position"/>
          <TextInput v-model="work.location" label="Location"/>
          <TextInput v-model="work.startDate" label="Start Date"/>
          <TextInput v-model="work.endDate" label="End Date"/>
        </div>
        <label :for="'summary-' + index" class="font-bold block mb-3 mt-3">Summary</label>
        <Textarea auto-resize :id="'summary-' + index" v-model="work.summary" placeholder="Description of the job (optional)" style="width:100%"/>
        <label :for="'highlight-' + index + '-' + 0" class="font-bold block mb-3 mt-3">Highlights</label>
        <VueDraggable v-model="work.highlights" handle=".handle">
          <InputItem
              v-for="(highlight, highlightIndex) in work.highlights"
              :key="highlightIndex"
              skip-summary
              @delete="work.highlights.splice(highlightIndex, 1)"
          >
        <Textarea
            :id="'highlight-' + index + '-' + highlightIndex"
            v-model="work.highlights[highlightIndex]"
            style="width:100%"
            auto-resize
        />
          </InputItem>
        </VueDraggable>
        <button @click="addHighlight(work)" class="button-add">
          <i class="fas fa-plus"></i> Add Highlight
        </button>
      </InputItem>
    </VueDraggable>
    <button @click="addExperience" class="button-add">
      <i class="fas fa-plus"></i> Add Experience
    </button>
  </Section>

  <Section legend="Conferences" icon="fas fa-microphone">
    <VueDraggable v-model="dataStore.data.conferences" handle=".handle">
      <InputItem v-for="(conference, index) in dataStore.data.conferences"
                 :key="index"
                 v-model="dataStore.data.conferences[index]"
                 @delete="removeElement(dataStore.data.conferences, index)">
        <div class="grid-2">
          <TextInput v-model="conference.conference" label="Conference"/>
          <TextInput v-model="conference.name" label="Name"/>
          <TextInput v-model="conference.location" label="Location"/>
          <TextInput v-model="conference.time" label="Time"/>
        </div>
        <label :for="'conference-summary-' + index" class="font-bold block mb-3 mt-3">Summary</label>
        <Textarea auto-resize :id="'conference-summary-' + index" v-model="conference.summary" placeholder="Description of the job (optional)"
                  style="width:100%"/>
      </InputItem>
    </VueDraggable>
    <button @click="addConference" class="button-add">
      <i class="fas fa-plus"></i> Add Conference
    </button>
  </Section>

  <Section legend="Education" icon="fas fa-graduation-cap">
    <VueDraggable v-model="dataStore.data.education" handle=".handle">
      <InputItem v-for="(education, index) in dataStore.data.education"
                 :key="index"
                 v-model="dataStore.data.education[index]"
                 @delete="removeElement(dataStore.data.education,index)">
        <div class="grid-2">
          <TextInput v-model="education.institution" label="Institution"/>
          <TextInput v-model="education.studyType" label="Study Type"/>
          <TextInput v-model="education.startDate" label="Start Date"/>
          <TextInput v-model="education.endDate" label="End Date"/>
        </div>
        <!--      <label :for="'conference-summary-' + index" class="font-bold block mb-3 mt-3">Summary</label>-->
        <!--      <Textarea auto-resize :id="'conference-summary-' + index" v-model="education.summary" placeholder="Description of the job (optional)"-->
        <!--                style="width:100%"/>-->
      </InputItem>
    </VueDraggable>
    <button @click="addEducation" class="button-add">
      <i class="fas fa-plus"></i> Add Education
    </button>
  </Section>

  <Section legend="Skills" icon="fas fa-brain">
    <VueDraggable v-model="dataStore.data.skills" handle=".handle">
      <InputItem v-for="(skill, index) in dataStore.data.skills"
                 :key="index"
                 v-model="dataStore.data.skills[index]"
                 @delete="removeElement(dataStore.data.skills,index)">
        <div class="grid-2">
          <TextInput v-model="skill.name" label="Name"/>
        </div>
        <label :for="'keywords-'+index" class="font-bold block mb-2 mt-2"> Keywords </label>
        <InputChips placeholder="Add a keyword" v-model="skill.keywords" :input-id="'keywords-'+index"/>
      </InputItem>
    </VueDraggable>
    <button @click="addSkill" class="button-add">
      <i class="fas fa-plus"></i> Add Skill
    </button>
  </Section>

  <Section legend="Languages" icon="fas fa-language">
    <VueDraggable v-model="dataStore.data.languages" handle=".handle">
      <InputItem v-for="(language, index) in dataStore.data.languages"
                 :key="index"
                 v-model="dataStore.data.languages[index]"
                 @delete="removeElement(dataStore.data.languages,index)">
        <div class="grid-2">
          <TextInput v-model="language.language" label="Language"/>
          <TextInput v-model="language.fluency" label="Fluency"/>
        </div>
      </InputItem>
    </VueDraggable>
    <button @click="addLanguage" class="button-add">
      <i class="fas fa-plus"></i> Add Language
    </button>
  </Section>
</template>

<style scoped lang="sass">
.section-title
  width: 100%
  margin: 1em 0
  font-weight: bold
  font-size: 1.6em

.button-add
  width: 100%
  padding: 1em
  //background: transparent
  border-radius: 10px
  border: 1px solid #555
  box-shadow: 4px 4px 4px #111
  background-color: rgba(#666, 0.1)

  &:hover
    cursor: pointer
    border-color: var(--p-primary-color)
    color: var(--p-primary-color)

  i
    margin-right: 0.5em

::v-deep(.p-icon):hover
  border-color: var(--p-primary-color)
  color: var(--p-primary-color)

</style>
