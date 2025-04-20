// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

// https://astro.build/config
export default defineConfig({
	output: "static",
	integrations: [
		starlight({
			title: 'Nucleus UI',
			favicon: '/favicon.png',
			sidebar: [
				{
					label: 'Getting started',
					link: ''
				},
				{
					label: 'Components',
					autogenerate: { directory: 'Components' },
					collapsed: false,
				},
			],
		}),
	],
});