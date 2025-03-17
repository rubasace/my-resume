<script setup>
import {useDataStore} from "@/stores/dataStore";
import {InputText} from "primevue";

const dataStore = useDataStore();

</script>

<template>

  <!--  TODO add translations-->
  <!--  TODO add filepicket for picture-->

  <div class="card">
    <div class="section-title">Basic Data</div>
    <div class="flex flex-wrap gap-3 mb-4">
      <div class="flex-auto">
        <label for="name" class="font-bold block mb-2"> Name </label>
        <InputText id="name" v-model="dataStore.data.basics.name" fluid/>
      </div>
      <div class="flex-auto">
        <label for="title" class="font-bold block mb-2"> Title </label>
        <InputText id="title" v-model="dataStore.data.basics.label" fluid/>
      </div>
    </div>
    <div class="flex flex-wrap gap-3 mb-4">
      <div class="flex-auto">
        <label for="picture" class="font-bold block mb-2"> Picture </label>
        <InputText id="picture" v-model="dataStore.data.basics.picture" fluid/>
      </div>
      <div class="flex-auto">
        <label for="email" class="font-bold block mb-2"> Email </label>
        <InputText id="email" v-model="dataStore.data.basics.email" fluid/>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="section-title">Experience</div>
    <div class="flex flex-wrap gap-3 mb-4">
      <div class="flex-auto">
        <label for="integer" class="font-bold block mb-2"> Integer </label>
        <InputText id="integer" v-model="integer" v-keyfilter.int fluid/>
      </div>
      <div class="flex-auto">
        <label for="number" class="font-bold block mb-2"> Number </label>
        <InputText id="number" v-model="number" v-keyfilter.num fluid/>
      </div>
      <div class="flex-auto">
        <label for="money" class="font-bold block mb-2"> Money </label>
        <InputText id="money" v-model="money" v-keyfilter.money fluid/>
      </div>
    </div>
    <div class="flex flex-wrap gap-3">
      <div class="flex-auto">
        <label for="hex" class="font-bold block mb-2"> Hex </label>
        <InputText id="hex" v-model="hex" v-keyfilter.hex fluid/>
      </div>
      <div class="flex-auto">
        <label for="alphabetic" class="font-bold block mb-2"> Alphabetic </label>
        <InputText id="alphabetic" v-model="alphabetic" v-keyfilter.alpha fluid/>
      </div>
      <div class="flex-auto">
        <label for="alphanumeric" class="font-bold block mb-2"> Alphanumeric </label>
        <InputText id="alphanumeric" v-model="alphanumeric" v-keyfilter.alphanum fluid/>
      </div>
    </div>
  </div>

  <div class="card">
    <div class="section-title">Volunteer</div>
    <div class="flex flex-wrap gap-3 mb-4">
      <div class="flex-auto">
        <label for="integer" class="font-bold block mb-2"> Integer </label>
        <InputText id="integer" v-model="integer" v-keyfilter.int fluid/>
      </div>
      <div class="flex-auto">
        <label for="number" class="font-bold block mb-2"> Number </label>
        <InputText id="number" v-model="number" v-keyfilter.num fluid/>
      </div>
      <div class="flex-auto">
        <label for="money" class="font-bold block mb-2"> Money </label>
        <InputText id="money" v-model="money" v-keyfilter.money fluid/>
      </div>
    </div>
    <div class="flex flex-wrap gap-3">
      <div class="flex-auto">
        <label for="hex" class="font-bold block mb-2"> Hex </label>
        <InputText id="hex" v-model="hex" v-keyfilter.hex fluid/>
      </div>
      <div class="flex-auto">
        <label for="alphabetic" class="font-bold block mb-2"> Alphabetic </label>
        <InputText id="alphabetic" v-model="alphabetic" v-keyfilter.alpha fluid/>
      </div>
      <div class="flex-auto">
        <label for="alphanumeric" class="font-bold block mb-2"> Alphanumeric </label>
        <InputText id="alphanumeric" v-model="alphanumeric" v-keyfilter.alphanum fluid/>
      </div>
    </div>
  </div>

  <div class="card">
    <div class="section-title">Education</div>
    <div class="flex flex-wrap gap-3 mb-4">
      <div class="flex-auto">
        <label for="integer" class="font-bold block mb-2"> Integer </label>
        <InputText id="integer" v-model="integer" v-keyfilter.int fluid/>
      </div>
      <div class="flex-auto">
        <label for="number" class="font-bold block mb-2"> Number </label>
        <InputText id="number" v-model="number" v-keyfilter.num fluid/>
      </div>
      <div class="flex-auto">
        <label for="money" class="font-bold block mb-2"> Money </label>
        <InputText id="money" v-model="money" v-keyfilter.money fluid/>
      </div>
    </div>
    <div class="flex flex-wrap gap-3">
      <div class="flex-auto">
        <label for="hex" class="font-bold block mb-2"> Hex </label>
        <InputText id="hex" v-model="hex" v-keyfilter.hex fluid/>
      </div>
      <div class="flex-auto">
        <label for="alphabetic" class="font-bold block mb-2"> Alphabetic </label>
        <InputText id="alphabetic" v-model="alphabetic" v-keyfilter.alpha fluid/>
      </div>
      <div class="flex-auto">
        <label for="alphanumeric" class="font-bold block mb-2"> Alphanumeric </label>
        <InputText id="alphanumeric" v-model="alphanumeric" v-keyfilter.alphanum fluid/>
      </div>
    </div>
  </div>

  <div class="card">
    <div class="section-title">Awards</div>
    <div class="flex flex-wrap gap-3 mb-4">
      <div class="flex-auto">
        <label for="integer" class="font-bold block mb-2"> Integer </label>
        <InputText id="integer" v-model="integer" v-keyfilter.int fluid/>
      </div>
      <div class="flex-auto">
        <label for="number" class="font-bold block mb-2"> Number </label>
        <InputText id="number" v-model="number" v-keyfilter.num fluid/>
      </div>
      <div class="flex-auto">
        <label for="money" class="font-bold block mb-2"> Money </label>
        <InputText id="money" v-model="money" v-keyfilter.money fluid/>
      </div>
    </div>
    <div class="flex flex-wrap gap-3">
      <div class="flex-auto">
        <label for="hex" class="font-bold block mb-2"> Hex </label>
        <InputText id="hex" v-model="hex" v-keyfilter.hex fluid/>
      </div>
      <div class="flex-auto">
        <label for="alphabetic" class="font-bold block mb-2"> Alphabetic </label>
        <InputText id="alphabetic" v-model="alphabetic" v-keyfilter.alpha fluid/>
      </div>
      <div class="flex-auto">
        <label for="alphanumeric" class="font-bold block mb-2"> Alphanumeric </label>
        <InputText id="alphanumeric" v-model="alphanumeric" v-keyfilter.alphanum fluid/>
      </div>
    </div>
  </div>

  <div class="card">
    <div class="section-title">Certificates</div>
    <div class="flex flex-wrap gap-3 mb-4">
      <div class="flex-auto">
        <label for="integer" class="font-bold block mb-2"> Integer </label>
        <InputText id="integer" v-model="integer" v-keyfilter.int fluid/>
      </div>
      <div class="flex-auto">
        <label for="number" class="font-bold block mb-2"> Number </label>
        <InputText id="number" v-model="number" v-keyfilter.num fluid/>
      </div>
      <div class="flex-auto">
        <label for="money" class="font-bold block mb-2"> Money </label>
        <InputText id="money" v-model="money" v-keyfilter.money fluid/>
      </div>
    </div>
    <div class="flex flex-wrap gap-3">
      <div class="flex-auto">
        <label for="hex" class="font-bold block mb-2"> Hex </label>
        <InputText id="hex" v-model="hex" v-keyfilter.hex fluid/>
      </div>
      <div class="flex-auto">
        <label for="alphabetic" class="font-bold block mb-2"> Alphabetic </label>
        <InputText id="alphabetic" v-model="alphabetic" v-keyfilter.alpha fluid/>
      </div>
      <div class="flex-auto">
        <label for="alphanumeric" class="font-bold block mb-2"> Alphanumeric </label>
        <InputText id="alphanumeric" v-model="alphanumeric" v-keyfilter.alphanum fluid/>
      </div>
    </div>
  </div>

  <div class="card">
    <div class="section-title">Publications</div>
    <div class="flex flex-wrap gap-3 mb-4">
      <div class="flex-auto">
        <label for="integer" class="font-bold block mb-2"> Integer </label>
        <InputText id="integer" v-model="integer" v-keyfilter.int fluid/>
      </div>
      <div class="flex-auto">
        <label for="number" class="font-bold block mb-2"> Number </label>
        <InputText id="number" v-model="number" v-keyfilter.num fluid/>
      </div>
      <div class="flex-auto">
        <label for="money" class="font-bold block mb-2"> Money </label>
        <InputText id="money" v-model="money" v-keyfilter.money fluid/>
      </div>
    </div>
    <div class="flex flex-wrap gap-3">
      <div class="flex-auto">
        <label for="hex" class="font-bold block mb-2"> Hex </label>
        <InputText id="hex" v-model="hex" v-keyfilter.hex fluid/>
      </div>
      <div class="flex-auto">
        <label for="alphabetic" class="font-bold block mb-2"> Alphabetic </label>
        <InputText id="alphabetic" v-model="alphabetic" v-keyfilter.alpha fluid/>
      </div>
      <div class="flex-auto">
        <label for="alphanumeric" class="font-bold block mb-2"> Alphanumeric </label>
        <InputText id="alphanumeric" v-model="alphanumeric" v-keyfilter.alphanum fluid/>
      </div>
    </div>
  </div>

  <div class="card">
    <div class="section-title">Skills</div>
    <div class="flex flex-wrap gap-3 mb-4">
      <div class="flex-auto">
        <label for="integer" class="font-bold block mb-2"> Integer </label>
        <InputText id="integer" v-model="integer" v-keyfilter.int fluid/>
      </div>
      <div class="flex-auto">
        <label for="number" class="font-bold block mb-2"> Number </label>
        <InputText id="number" v-model="number" v-keyfilter.num fluid/>
      </div>
      <div class="flex-auto">
        <label for="money" class="font-bold block mb-2"> Money </label>
        <InputText id="money" v-model="money" v-keyfilter.money fluid/>
      </div>
    </div>
    <div class="flex flex-wrap gap-3">
      <div class="flex-auto">
        <label for="hex" class="font-bold block mb-2"> Hex </label>
        <InputText id="hex" v-model="hex" v-keyfilter.hex fluid/>
      </div>
      <div class="flex-auto">
        <label for="alphabetic" class="font-bold block mb-2"> Alphabetic </label>
        <InputText id="alphabetic" v-model="alphabetic" v-keyfilter.alpha fluid/>
      </div>
      <div class="flex-auto">
        <label for="alphanumeric" class="font-bold block mb-2"> Alphanumeric </label>
        <InputText id="alphanumeric" v-model="alphanumeric" v-keyfilter.alphanum fluid/>
      </div>
    </div>
  </div>

  <div class="card">
    <div class="section-title">Languages</div>
    <div class="flex flex-wrap gap-3 mb-4">
      <div class="flex-auto">
        <label for="integer" class="font-bold block mb-2"> Integer </label>
        <InputText id="integer" v-model="integer" v-keyfilter.int fluid/>
      </div>
      <div class="flex-auto">
        <label for="number" class="font-bold block mb-2"> Number </label>
        <InputText id="number" v-model="number" v-keyfilter.num fluid/>
      </div>
      <div class="flex-auto">
        <label for="money" class="font-bold block mb-2"> Money </label>
        <InputText id="money" v-model="money" v-keyfilter.money fluid/>
      </div>
    </div>
    <div class="flex flex-wrap gap-3">
      <div class="flex-auto">
        <label for="hex" class="font-bold block mb-2"> Hex </label>
        <InputText id="hex" v-model="hex" v-keyfilter.hex fluid/>
      </div>
      <div class="flex-auto">
        <label for="alphabetic" class="font-bold block mb-2"> Alphabetic </label>
        <InputText id="alphabetic" v-model="alphabetic" v-keyfilter.alpha fluid/>
      </div>
      <div class="flex-auto">
        <label for="alphanumeric" class="font-bold block mb-2"> Alphanumeric </label>
        <InputText id="alphanumeric" v-model="alphanumeric" v-keyfilter.alphanum fluid/>
      </div>
    </div>
  </div>

  <div class="card">
    <div class="section-title">Interests</div>
    <div class="flex flex-wrap gap-3 mb-4">
      <div class="flex-auto">
        <label for="integer" class="font-bold block mb-2"> Integer </label>
        <InputText id="integer" v-model="integer" v-keyfilter.int fluid/>
      </div>
      <div class="flex-auto">
        <label for="number" class="font-bold block mb-2"> Number </label>
        <InputText id="number" v-model="number" v-keyfilter.num fluid/>
      </div>
      <div class="flex-auto">
        <label for="money" class="font-bold block mb-2"> Money </label>
        <InputText id="money" v-model="money" v-keyfilter.money fluid/>
      </div>
    </div>
    <div class="flex flex-wrap gap-3">
      <div class="flex-auto">
        <label for="hex" class="font-bold block mb-2"> Hex </label>
        <InputText id="hex" v-model="hex" v-keyfilter.hex fluid/>
      </div>
      <div class="flex-auto">
        <label for="alphabetic" class="font-bold block mb-2"> Alphabetic </label>
        <InputText id="alphabetic" v-model="alphabetic" v-keyfilter.alpha fluid/>
      </div>
      <div class="flex-auto">
        <label for="alphanumeric" class="font-bold block mb-2"> Alphanumeric </label>
        <InputText id="alphanumeric" v-model="alphanumeric" v-keyfilter.alphanum fluid/>
      </div>
    </div>
  </div>

  <div class="card">
    <div class="section-title">References</div>
    <div class="flex flex-wrap gap-3 mb-4">
      <div class="flex-auto">
        <label for="integer" class="font-bold block mb-2"> Integer </label>
        <InputText id="integer" v-model="integer" v-keyfilter.int fluid/>
      </div>
      <div class="flex-auto">
        <label for="number" class="font-bold block mb-2"> Number </label>
        <InputText id="number" v-model="number" v-keyfilter.num fluid/>
      </div>
      <div class="flex-auto">
        <label for="money" class="font-bold block mb-2"> Money </label>
        <InputText id="money" v-model="money" v-keyfilter.money fluid/>
      </div>
    </div>
    <div class="flex flex-wrap gap-3">
      <div class="flex-auto">
        <label for="hex" class="font-bold block mb-2"> Hex </label>
        <InputText id="hex" v-model="hex" v-keyfilter.hex fluid/>
      </div>
      <div class="flex-auto">
        <label for="alphabetic" class="font-bold block mb-2"> Alphabetic </label>
        <InputText id="alphabetic" v-model="alphabetic" v-keyfilter.alpha fluid/>
      </div>
      <div class="flex-auto">
        <label for="alphanumeric" class="font-bold block mb-2"> Alphanumeric </label>
        <InputText id="alphanumeric" v-model="alphanumeric" v-keyfilter.alphanum fluid/>
      </div>
    </div>
  </div>

  <div class="card">
    <div class="section-title">Projects</div>
    <div class="flex flex-wrap gap-3 mb-4">
      <div class="flex-auto">
        <label for="integer" class="font-bold block mb-2"> Integer </label>
        <InputText id="integer" v-model="integer" v-keyfilter.int fluid/>
      </div>
      <div class="flex-auto">
        <label for="number" class="font-bold block mb-2"> Number </label>
        <InputText id="number" v-model="number" v-keyfilter.num fluid/>
      </div>
      <div class="flex-auto">
        <label for="money" class="font-bold block mb-2"> Money </label>
        <InputText id="money" v-model="money" v-keyfilter.money fluid/>
      </div>
    </div>
    <div class="flex flex-wrap gap-3">
      <div class="flex-auto">
        <label for="hex" class="font-bold block mb-2"> Hex </label>
        <InputText id="hex" v-model="hex" v-keyfilter.hex fluid/>
      </div>
      <div class="flex-auto">
        <label for="alphabetic" class="font-bold block mb-2"> Alphabetic </label>
        <InputText id="alphabetic" v-model="alphabetic" v-keyfilter.alpha fluid/>
      </div>
      <div class="flex-auto">
        <label for="alphanumeric" class="font-bold block mb-2"> Alphanumeric </label>
        <InputText id="alphanumeric" v-model="alphanumeric" v-keyfilter.alphanum fluid/>
      </div>
    </div>
  </div>

  <!--    <div class="p-field">-->
  <!--      <label for="tournamentName">Tournament Name</label>-->
  <!--      <InputText v-model="tournamentInfoStore.tournamentName" id="tournamentName"/>-->
  <!--    </div>-->

  <!--    <div class="p-field">-->
  <!--      <label for="currency">Currency*</label>-->
  <!--      <Select-->
  <!--          filter-->
  <!--          v-model="tournamentInfoStore.currency"-->
  <!--          id="currency"-->
  <!--          :options="currencies"-->
  <!--          option-label="name"-->
  <!--          placeholder="Select a currency"-->
  <!--      />-->
  <!--    </div>-->

  <!--    <div class="p-field">-->
  <!--      <label for="tournamentName">Estimated Duration (h)</label>-->
  <!--      <InputText v-model="tournamentInfoStore.estimatedDurationHours" id="estimatedDurationHours"/>-->
  <!--    </div>-->

  <!--    <div class="section-title">Prizes</div>-->

  <!--    <div class="p-field">-->
  <!--      <label for="guaranteedPrize">Guaranteed Prize</label>-->
  <!--      <InputNumber v-model="tournamentInfoStore.guaranteedPrize" id="guaranteedPrize" :min="0" :currency="tournamentInfoStore.currency?.code" mode="currency"/>-->
  <!--    </div>-->

  <!--    <div class="p-field">-->
  <!--      <label for="addedPrize">Added Prize</label>-->
  <!--      <InputNumber v-model="tournamentInfoStore.addedPrize" id="addedPrize" :min="0" :currency="tournamentInfoStore.currency?.code" mode="currency"/>-->
  <!--    </div>-->

  <!--    <div class="section-title">Buy-In Info</div>-->

  <!--    <div class="p-field">-->
  <!--      <label for="entryFee">Entry Fee*</label>-->
  <!--      <InputNumber v-model="tournamentInfoStore.entryFee" id="entryFee" :min="0" :currency="tournamentInfoStore.currency?.code" mode="currency"/>-->
  <!--    </div>-->

  <!--    <div class="p-field">-->
  <!--      <label for="entryFee">Entry Rake*</label>-->
  <!--      <InputNumber v-model="tournamentInfoStore.entryRake" id="entryRake" :min="0" :currency="tournamentInfoStore.currency?.code" mode="currency"/>-->
  <!--    </div>-->

  <!--    <div class="p-field">-->
  <!--      <label for="initialStack">Initial Stack*</label>-->
  <!--      <InputNumber v-model="tournamentInfoStore.initialStack" id="initialStack" :min="0"/>-->
  <!--    </div>-->

  <!--    <div class="section-title">Reentry</div>-->
  <!--    <div class="p-field">-->
  <!--      <label for="reentryEnabled">Enable Reentry</label>-->
  <!--      <Checkbox v-model="tournamentInfoStore.reentryEnabled" id="reentryEnabled" binary/>-->
  <!--    </div>-->
  <!--    <div/>-->

  <!--    <div class="p-field">-->
  <!--      <label for="reentryFee">Reentry Fee</label>-->
  <!--      <InputNumber v-model="tournamentInfoStore.reentryFee" id="reentryFee" :min="0" :currency="tournamentInfoStore.currency?.code" mode="currency"-->
  <!--                   :disabled="!tournamentInfoStore.reentryEnabled"/>-->
  <!--    </div>-->

  <!--    <div class="p-field">-->
  <!--      <label for="reentryFee">Reentry Rake</label>-->
  <!--      <InputNumber v-model="tournamentInfoStore.reentryRake" id="reentryRake" :min="0" :currency="tournamentInfoStore.currency?.code" mode="currency"-->
  <!--                   :disabled="!tournamentInfoStore.reentryEnabled"/>-->
  <!--    </div>-->

  <!--    <div class="p-field">-->
  <!--      <label for="maxReentries">Max Reentries</label>-->
  <!--      <InputNumber v-model="tournamentInfoStore.maxReentries" id="maxReentries" :min="0" :disabled="!tournamentInfoStore.reentryEnabled"/>-->
  <!--    </div>-->

  <!--    <div class="section-title">Addon</div>-->
  <!--    <div class="p-field">-->
  <!--      <label for="addonEnabled">Enable Addon</label>-->
  <!--      <Checkbox v-model="tournamentInfoStore.addonEnabled" id="addonEnabled" binary/>-->
  <!--    </div>-->

  <!--    <div class="p-field">-->
  <!--      <label for="addonEnabled">Enable Double Addon</label>-->
  <!--      <Checkbox v-model="tournamentInfoStore.doubleAddonEnabled" id="doubleAddonEnabled" :disabled="!tournamentInfoStore.addonEnabled" binary/>-->
  <!--    </div>-->

  <!--    <div class="p-field">-->
  <!--      <label for="addonFee">Addon Fee</label>-->
  <!--      <InputNumber v-model="tournamentInfoStore.addonFee" id="addonFee" :min="0" :currency="tournamentInfoStore.currency?.code" mode="currency"-->
  <!--                   :disabled="!tournamentInfoStore.addonEnabled"/>-->
  <!--    </div>-->

  <!--    <div class="p-field">-->
  <!--      <label for="addonFee">Addon Rake</label>-->
  <!--      <InputNumber v-model="tournamentInfoStore.addonRake" id="addonRake" :min="0" :currency="tournamentInfoStore.currency?.code" mode="currency"-->
  <!--                   :disabled="!tournamentInfoStore.addonEnabled"/>-->
  <!--    </div>-->

  <!--    <div class="p-field">-->
  <!--      <label for="addonStack">Addon Stack</label>-->
  <!--      <InputNumber v-model="tournamentInfoStore.addonStack" id="addonStack" :min="0" :disabled="!tournamentInfoStore.addonEnabled"/>-->
  <!--    </div>-->

  <!--  </div>-->
</template>

<style scoped lang="sass">
.p-field
  width: 100%
  min-width: 200px
  display: flex
  flex-direction: column
  margin-top: 1em

.section-title
  width: 100%
  margin: 1em 0
  font-weight: bold
  font-size: 1.6em


@media (max-width: 680px)
  .p-field
    width: 100%
</style>
