<script setup>
import {useDataStore} from "@/stores/dataStore";
import {InputText, Textarea, InputChips} from "primevue";
import TextInput from "@/components/editor/TextInput.vue";
import InputItem from "@/components/editor/InputItem.vue";


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


const moveUp = (array, index) => {
  if (index > 0) {
    [array[index], array[index - 1]] = [array[index - 1], array[index]];
  }
};

const moveDown = (array, index) => {
  if (index < array.length - 1) {
    [array[index], array[index + 1]] = [array[index + 1], array[index]];
  }
};

</script>

<template>

  <!--  TODO add translations-->
  <!--  TODO add filepicker for picture-->
  <!--  TODO Implement reorder with draggable instead (look for alternative given it's not actively developed) -->
  <!--  TODO show elements compacted with option to click and expand to see details-->

  <div class="card">
    <div class="section-title">Basic Data</div>
    <div class="grid-2">
      <TextInput v-model="dataStore.data.basics.name" label="Name"/>
      <TextInput v-model="dataStore.data.basics.label" label="Label"/>
      <TextInput v-model="dataStore.data.basics.picture" label="Picture"/>
      <TextInput v-model="dataStore.data.basics.email" label="Email"/>
    </div>
    <Textarea auto-resize id="summary" v-model="dataStore.data.basics.summary" placeholder="Information about yourself (optional)" style="width:100%;height:20em;resize:none" class="mb-2 mt-2"/>
  </div>

  <div class="card">
    <div class="section-title">Profiles</div>
    <InputItem v-for="(profile, index) in dataStore.data.basics.profiles"
               :key="index"
               @move-up="moveUp(dataStore.data.basics.profiles, index)"
               @move-down="moveDown(dataStore.data.basics.profiles, index)"
               @delete="removeElement(dataStore.data.basics.profiles, index)">
      <div class="grid-3">
        <TextInput v-model="profile.network" label="Network"/>
        <TextInput v-model="profile.url" label="URL"/>
        <TextInput v-model="profile.text" label="Text"/>
      </div>
    </InputItem>
    <button @click="addProfile" class="button-add">
      <i class="fas fa-plus mr-2"></i> Add Profile
    </button>
  </div>

  <div class="card">
    <div class="section-title">Experience</div>
    <InputItem v-for="(work, index) in dataStore.data.work"
               :key="index"
               @move-up="moveUp(dataStore.data.work, index)"
               @move-down="moveDown(dataStore.data.work, index)"
               @delete="removeElement(dataStore.data.work,index)">
      <div class="grid-3">
        <TextInput v-model="work.name" label="Company"/>
        <TextInput v-model="work.position" label="Position"/>
        <TextInput v-model="work.location" label="Location"/>
        <TextInput v-model="work.startDate" label="Start Date"/>
        <TextInput v-model="work.endDate" label="End Date"/>
      </div>
      <label :for="'summary-' + index" class="font-bold block mb-3 mt-3">Summary</label>
      <Textarea auto-resize :id="'summary-' + index" v-model="work.summary" placeholder="Description of the job (optional)" style="width:100%;height:20em;resize:none"/>
      <label :for="'highlight-' + index + '-' + 0" class="font-bold block mb-3 mt-3">Highlights</label>
      <InputItem
          v-for="(highlight, highlightIndex) in work.highlights"
          :key="highlightIndex"
          @move-up="moveUp(work.highlights, highlightIndex)"
          @move-down="moveDown(work.highlights, highlightIndex)"
          @delete="work.highlights.splice(highlightIndex, 1)"
      >
        <Textarea
            :id="'highlight-' + index + '-' + highlightIndex"
            v-model="work.highlights[highlightIndex]"
            style="width:100%"
            auto-resize
        />
      </InputItem>
      <button @click="addHighlight(work)" class="button-add">
        <i class="fas fa-plus mr-2"></i> Add Highlight
      </button>
    </InputItem>
    <button @click="addExperience" class="button-add">
      <i class="fas fa-plus mr-2"></i> Add Experience
    </button>
  </div>

  <div class="card">
    <div class="section-title">Conferences</div>
    <InputItem v-for="(conference, index) in dataStore.data.conferences"
               :key="index"
               @move-up="moveUp(dataStore.data.conferences, index)"
               @move-down="moveDown(dataStore.data.conferences, index)"
               @delete="removeElement(dataStore.data.conferences, index)">
      <div class="grid-2">
        <TextInput v-model="conference.conference" label="Conference"/>
        <TextInput v-model="conference.name" label="Name"/>
        <TextInput v-model="conference.location" label="Location"/>
        <TextInput v-model="conference.time" label="Time"/>
      </div>
      <label :for="'conference-summary-' + index" class="font-bold block mb-3 mt-3">Summary</label>
      <Textarea auto-resize :id="'conference-summary-' + index" v-model="conference.summary" placeholder="Description of the job (optional)"
                style="width:100%;height:20em;resize:none"/>
    </InputItem>
    <button @click="addConference" class="button-add">
      <i class="fas fa-plus mr-2"></i> Add Conference
    </button>
  </div>

  <div class="card">
    <div class="section-title">Education</div>
    <InputItem v-for="(education, index) in dataStore.data.education"
               :key="index"
               @move-up="moveUp(dataStore.data.education, index)"
               @move-down="moveDown(dataStore.data.education, index)"
               @delete="removeElement(dataStore.data.education,index)">
      <div class="grid-2">
        <TextInput v-model="education.institution" label="Institution"/>
        <TextInput v-model="education.studyType" label="Study Type"/>
        <TextInput v-model="education.startDate" label="Start Date"/>
        <TextInput v-model="education.endDate" label="End Date"/>
      </div>
<!--      <label :for="'conference-summary-' + index" class="font-bold block mb-3 mt-3">Summary</label>-->
<!--      <Textarea auto-resize :id="'conference-summary-' + index" v-model="education.summary" placeholder="Description of the job (optional)"-->
<!--                style="width:100%;height:20em;resize:none"/>-->
    </InputItem>
    <button @click="addEducation" class="button-add">
      <i class="fas fa-plus mr-2"></i> Add Education
    </button>
  </div>

  <div class="card">
    <div class="section-title">Skills</div>
    <InputItem v-for="(skill, index) in dataStore.data.skills"
               :key="index"
               @move-up="moveUp(dataStore.data.skills, index)"
               @move-down="moveDown(dataStore.data.skills, index)"
               @delete="removeElement(dataStore.data.skills,index)">
      <div class="grid-2">
        <TextInput v-model="skill.name" label="Name"/>
      </div>
      <label :for="'keywords-'+index" class="font-bold block mb-2 mt-2"> Keywords </label>
      <InputChips placeholder="Add a keyword"  v-model="skill.keywords" :input-id="'keywords-'+index" />
<!--        TODO revisit id so it is unique (index and keywordIndex could collide in reverse-->
<!--        <InputText-->
<!--            :id="'keyword-' + index + '-' + keywordIndex"-->
<!--            v-model="skill.keywords[keywordIndex]"-->
<!--            style="width:100%"-->
<!--            auto-resize-->
<!--        />-->
<!--      <button @click="addKeyword(skill)" class="button-add">-->
<!--        <i class="fas fa-plus mr-2"></i> Add Keyword-->
<!--      </button>-->
    </InputItem>
    <button @click="addSkill" class="button-add">
      <i class="fas fa-plus mr-2"></i> Add Skill
    </button>
  </div>

  <div class="card">
    <div class="section-title">Languages</div>
    <InputItem v-for="(language, index) in dataStore.data.languages"
               :key="index"
               @move-up="moveUp(dataStore.data.languages, index)"
               @move-down="moveDown(dataStore.data.languages, index)"
               @delete="removeElement(dataStore.data.languages,index)">
      <div class="grid-2">
        <TextInput v-model="language.language" label="Language"/>
        <TextInput v-model="language.fluency" label="Fluency"/>
      </div>
    </InputItem>
    <button @click="addLanguage" class="button-add">
      <i class="fas fa-plus mr-2"></i> Add Language
    </button>
  </div>
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
  background: transparent
  border-radius: 10px
  border: 1px solid #555
  &:hover
    border-color: #34d399
    color: #34d399


</style>
