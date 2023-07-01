import type { EntryGenerator } from './$types';

export const prerender = true;
export const trailingSlash = 'always';

export const entries: EntryGenerator = () => [
  '/',
  '/fileHandler'
];
