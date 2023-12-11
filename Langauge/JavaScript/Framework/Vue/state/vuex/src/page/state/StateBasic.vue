<template>
    <div>
        <h2>Basic</h2>
        <div>
          {{ count  }}
        </div>
        <div>
          <!-- {{ getCount }} -->
        </div>
        <button @click="increment(20)">add count 20</button>
        <!-- <button @click="incrementAction(50)">add count 40</button>
        <button @click="log">log</button> -->
        <div>
          {{ text }}
        </div>
        <div>
          <input v-model="text" @input="updateInput">
        </div>
    </div>
</template>

<script>
import { mapState, mapGetters, mapActions, mapMutations } from 'vuex';
export default {
  name: 'StateBasic',
  components: {
    
  },
  computed: {
    
    // count() {
    //   return this.$store.state.count;
    // },
    // getCount() {
    //   return this.$store.getters.getCount;
    // },
    ...mapState({
      count: state => state.count.count,
      text: state => state.text.text,
    }),
    ...mapGetters({
      getCount: 'getCount',
      getText: 'getText',
    })
  },
  methods: {
    ...mapMutations([
      'increment',
      'input',
    ]),
    ...mapActions({
      incrementAction: (dispatch, payload) => dispatch('incrementAction', payload),
      inputAction: (dispatch, payload) => dispatch('inputAction', payload),
    }),
    updateInput(e) {
      this.input(e.target.value);
    },

}}
</script>

<style scoped>

</style>