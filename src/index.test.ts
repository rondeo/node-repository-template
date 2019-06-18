import { main } from './';

describe('Setup', () => {
  it('executes without throwing an error', () => {
    expect(() => main()).not.toThrow();
  });

  it('prints a message', () => {
    main();
    expect(console.log).toHaveBeenCalledWith('hello world!');
  });
});
