<script setup>
import { provide, ref } from 'vue';
import DefineProp from './component/DefineProp.vue';
import Tutorial from './component/Tutorial.vue';
import VmodelBasic from './component/componentVmoel/VmodelBasic.vue';
import ComputedComponent from './component/componentVmoel/ComputedComponent.vue';
import ExpendOption from './component/inheritAttrs/ExpendOption.vue';
import ExpendOptionDisabled from './component/inheritAttrs/ExpendOptionDisabled.vue';
import Attrs from './component/inheritAttrs/Attrs.vue';
import EsampeSlot from './component/slot&outlet/EsampeSlot.vue';
import LayoutSlot from './component/slot&outlet/LayoutSlot.vue';
import ProvideVue from './component/provide/ProvideVue.vue';
import {injectionKey} from './component/provide/keys'
import AsyncComponent from './component/asyncComponent/AsyncComponent.vue';
import Nav from './Nav.vue';

const count = ref(0);
const h1Text = ref('')
const h2Text = ref('')
const h3Text = ref('')
provide('count', count);
provide(injectionKey, count);

function increment(e) {
  console.log(e);
  count.value++;
}

function inputHandle(e) {
  h1Text.value = e
}

function computedHandle(e){
  h2Text.value = e
}

function extendProps() {
  h3Text.value = 'text'
}

</script>

<template>

  <Nav />
  
  <h1>아래 자식 컴포너트가 있습니다.</h1>
  <Tutorial @count="increment" :count="count" />
  <br/><br/>
  <DefineProp :title='count' />
  <br/><br/>
  <h1>{{ h1Text }}</h1>
  <VmodelBasic @update:model-value="inputHandle" :model-value="h1Text" />

  <br/><br/>
  <h1>{{ h2Text }}</h1>
  <ComputedComponent @update:model-value="computedHandle" :model-value="h2Text" />

  <br/><br/>
  <h1>{{ h2Text }}</h1>
  <ComputedComponent v-model:model-value="h2Text" />
  <br/><br/>
  

  <!-- 풀스루 : 컴포넌트 속성 묵시적 상속 -->
  <h1>{{ h3Text }}</h1>
  
  <ExpendOption @click="extendProps"/>
  
  <br/><br/>
  
  <ExpendOptionDisabled @click="extendProps"/>
  
  <br/><br/>

  <Attrs test="test" class='btn'/>
  
  <br/><br/>

  <!-- btnSlot -->
  <EsampeSlot>childSlot</EsampeSlot>
  <br/><br/>
  
  <EsampeSlot />
  <br/><br/>

  <LayoutSlot>
    <Nav />
    <router-view /> 
    <template v-slot:header>
      <div class="header">header</div>
    </template>
    
    <!-- v-slot 축약 문법  -->
    <template #main>
      <div class="main">Main</div>
    </template>
    <!-- defualt slot  -->
    <div class="footer">footer</div>

  </LayoutSlot>


  <br/><br/>
  <h1>{{count}}</h1>
  <ProvideVue />

  <AsyncComponent />

</template>

<style lang="scss" scoped>
  .header {
    color: red;
    text-align: center;
  }
  .main {
    color: blue;
    text-align: center;
  }
  .footer {
    color: green;
    text-align: center;
  }
</style>
