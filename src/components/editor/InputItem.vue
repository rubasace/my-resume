<script setup>
import {defineEmits} from 'vue'

const emit = defineEmits(['moveUp', 'moveDown', 'delete', 'hide'])
</script>

<template>
  <div class="input-item">
    <div class="actions">
      <!-- TODO replace by draggable-->
      <i class="fa fa-arrow-up" @click="emit('moveUp')"></i>
      <i class="fa fa-arrow-down" @click="emit('moveDown')"></i>
    </div>

    <div class="content">
      <slot/>
    </div>

    <div class="actions">
      <i class="fa fa-trash" @click="emit('delete')"></i>
      <!-- TODO handle show/hide state -->
      <i class="fa fa-eye" @click="emit('hide')"></i>
    </div>
  </div>
</template>

<style scoped lang="sass">
.input-item
  width: 100%
  border: 1px solid #333
  margin: 1em auto
  border-radius: 10px
  display: flex
  align-items: center
  padding: 1em

  .content
    flex-grow: 1
    padding: 1em 2em

  .actions
    display: flex
    gap: 1em
    align-items: center

    i
      cursor: pointer
      font-size: 1em
      transition: color 0.2s

      &:hover
        //TODO take from theme being applied
        color: #34d399
</style>